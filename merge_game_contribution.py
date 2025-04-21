#!/usr/bin/env python3
"""
Game Contribution Merge Automation Script
Merges game contributions while filtering changes to only the game folder.
Works across Windows, macOS, and Linux.
"""

import os
import sys
import subprocess
import tempfile
import shutil
from pathlib import Path
from typing import List, Tuple, Optional


class GitMergeManager:
    """Manages git operations for merging game contributions."""

    def __init__(self, repo_path: str = "."):
        """Initialize the git manager."""
        self.repo_path = Path(repo_path).resolve()
        if not (self.repo_path / ".git").exists():
            raise ValueError(f"Not a git repository: {self.repo_path}")
        os.chdir(self.repo_path)

    def run_git(self, cmd: List[str], check: bool = True) -> Tuple[int, str, str]:
        """Run a git command and return (returncode, stdout, stderr)."""
        full_cmd = ["git"] + cmd
        try:
            result = subprocess.run(
                full_cmd,
                capture_output=True,
                text=True,
                check=False,
            )
            return result.returncode, result.stdout.strip(), result.stderr.strip()
        except Exception as e:
            if check:
                raise
            return 1, "", str(e)

    def run_git_check(self, cmd: List[str]) -> str:
        """Run a git command and return stdout, raising on error."""
        code, stdout, stderr = self.run_git(cmd, check=False)
        if code != 0:
            raise RuntimeError(f"Git error: {stderr or stdout}")
        return stdout

    def has_uncommitted_changes(self) -> bool:
        """Check if there are uncommitted changes."""
        code, stdout, _ = self.run_git(["status", "--porcelain"], check=False)
        return code == 0 and bool(stdout.strip())

    def get_current_branch(self) -> str:
        """Get the current branch name."""
        return self.run_git_check(["rev-parse", "--abbrev-ref", "HEAD"])

    def branch_exists(self, branch: str) -> bool:
        """Check if a branch exists."""
        code, _, _ = self.run_git(["rev-parse", "--verify", branch], check=False)
        return code == 0

    def create_branch(self, branch: str, start_point: str = "main") -> None:
        """Create a new branch."""
        self.run_git_check(["switch", "-c", branch, start_point])

    def switch_branch(self, branch: str) -> None:
        """Switch to a branch."""
        self.run_git_check(["switch", branch])

    def delete_branch(self, branch: str, force: bool = False) -> None:
        """Delete a branch."""
        cmd = ["branch", "-D" if force else "-d", branch]
        self.run_git(cmd, check=False)

    def fetch_remote(self, remote_url: str, branch: str) -> None:
        """Fetch a specific branch from remote."""
        self.run_git_check(["fetch", remote_url, branch])

    def get_commits_in_folder(self, branch: str, folder: str, base: str = "main") -> List[str]:
        """Get commits that modify files in a specific folder."""
        try:
            output = self.run_git_check(
                [
                    "log",
                    f"{base}..{branch}",
                    "--format=%H",
                    "--",
                    folder,
                ]
            )
            return [line for line in output.split("\n") if line.strip()]
        except RuntimeError:
            return []

    def get_modified_paths(self, commit: str) -> List[str]:
        """Get all files modified in a commit."""
        output = self.run_git_check(
            ["diff-tree", "--no-commit-id", "--name-only", "-r", commit]
        )
        return [line for line in output.split("\n") if line.strip()]

    def rebase_onto(
        self, branch: str, onto: str = "main", interactive: bool = False
    ) -> bool:
        """Rebase a branch onto another. Returns False if conflicts exist."""
        cmd = ["rebase"]
        if interactive:
            cmd.append("-i")
        cmd.extend([onto, branch])
        code, _, stderr = self.run_git(cmd, check=False)
        
        if code != 0:
            if "CONFLICT" in stderr:
                return False
            raise RuntimeError(f"Rebase failed: {stderr}")
        return True

    def cherry_pick(self, commit: str) -> bool:
        """Cherry-pick a commit. Returns False if conflicts."""
        code, _, stderr = self.run_git(["cherry-pick", commit], check=False)
        if code != 0:
            if "CONFLICT" in stderr or "conflict" in stderr.lower():
                return False
            raise RuntimeError(f"Cherry-pick failed: {stderr}")
        return True

    def abort_rebase(self) -> None:
        """Abort an ongoing rebase."""
        self.run_git(["rebase", "--abort"], check=False)

    def abort_cherry_pick(self) -> None:
        """Abort an ongoing cherry-pick."""
        self.run_git(["cherry-pick", "--abort"], check=False)

    def get_files_in_commit(self, commit: str, folder: str) -> List[str]:
        """Get files in a specific folder that were modified in a commit."""
        try:
            output = self.run_git_check(
                ["diff-tree", "--no-commit-id", "--name-only", "-r", commit]
            )
            files = [line for line in output.split("\n") if line.strip()]
            # Filter to files in the folder
            folder_normalized = folder.replace("\\", "/").strip("/")
            return [
                f
                for f in files
                if f.replace("\\", "/").startswith(folder_normalized + "/")
                or f.replace("\\", "/") == folder_normalized
            ]
        except RuntimeError:
            return []

    def merge_branch(self, branch: str, no_ff: bool = True) -> bool:
        """Merge a branch into current branch. Returns False if conflicts."""
        cmd = ["merge"]
        if no_ff:
            cmd.append("--no-ff")
        cmd.append(branch)
        code, stdout, stderr = self.run_git(cmd, check=False)
        
        if code != 0:
            if "CONFLICT" in stderr or "conflict" in stdout.lower():
                return False
            raise RuntimeError(f"Merge failed: {stderr}")
        return True

    def reset_hard(self, ref: str = "HEAD") -> None:
        """Hard reset to a reference."""
        self.run_git_check(["reset", "--hard", ref])


def merge_game_contribution(
    repo_path: str,
    contributor_url: str,
    contributor_branch: str,
    game_folder: str,
    temp_branch_prefix: str = "merge_temp",
) -> bool:
    """
    Merge a game contribution from a fork.
    
    Args:
        repo_path: Path to the repository
        contributor_url: Git URL of the contributor's fork
        contributor_branch: Branch name in the contributor's fork
        game_folder: Relative path to the game folder (e.g., "microjogos/2025S1/game_name")
        temp_branch_prefix: Prefix for temporary branches
        
    Returns:
        True if successful, False if manual intervention needed
    """
    git = GitMergeManager(repo_path)
    
    print(f"🎮 Starting game contribution merge")
    print(f"   Repository: {repo_path}")
    print(f"   Contributor URL: {contributor_url}")
    print(f"   Branch: {contributor_branch}")
    print(f"   Game folder: {game_folder}")
    print()
    
    # Check for uncommitted changes
    if git.has_uncommitted_changes():
        print("❌ Error: You have uncommitted changes. Please commit or stash them first.")
        return False
    
    # Get current branch
    original_branch = git.get_current_branch()
    temp_branch = f"{temp_branch_prefix}_{contributor_branch}"
    
    try:
        # Ensure main branch is up to date
        print("📥 Updating main branch...")
        git.switch_branch("main")
        git.run_git_check(["pull", "origin", "main"])
        print("✅ Main branch updated\n")
        
        # Fetch contributor's branch
        print(f"📥 Fetching contributor branch: {contributor_branch}")
        git.fetch_remote(contributor_url, contributor_branch)
        print("✅ Contributor branch fetched\n")
        
        # Create temporary branch from FETCH_HEAD
        print(f"🔧 Creating temporary branch: {temp_branch}")
        git.create_branch(temp_branch, "FETCH_HEAD")
        print("✅ Temporary branch created\n")
        
        # Get commits that touch the game folder
        print(f"🔍 Analyzing commits in folder: {game_folder}")
        commits = git.get_commits_in_folder(temp_branch, game_folder, "main")
        
        if not commits:
            print("⚠️  No commits found that modify the game folder.")
            print("   Cleaning up temporary branch...")
            git.switch_branch("main")
            git.delete_branch(temp_branch, force=True)
            return False
        
        print(f"✅ Found {len(commits)} commit(s) to apply\n")
        
        # Create merge branch from main
        merge_branch_name = f"merge_{contributor_branch}"
        print(f"🔧 Creating merge branch: {merge_branch_name}")
        git.create_branch(merge_branch_name, "main")
        print("✅ Merge branch created\n")
        
        # Apply each commit
        print(f"⏳ Applying {len(commits)} commit(s)...")
        successful_commits = 0
        skipped_commits = 0
        
        for i, commit in enumerate(commits, 1):
            # Get commit message
            msg = git.run_git_check(["log", "-1", "--format=%s", commit])
            print(f"   [{i}/{len(commits)}] {msg[:60]}")
            
            # Get files in this commit that are in the game folder
            files = git.get_files_in_commit(commit, game_folder)
            
            if not files:
                print(f"           ⚠️  No files in game folder, skipping")
                skipped_commits += 1
                continue
            
            # Try to cherry-pick
            if git.cherry_pick(commit):
                print(f"           ✅ Applied")
                successful_commits += 1
            else:
                print(f"           ⚠️  Conflict detected")
                print(f"\n⚠️  MERGE CONFLICT: Manual intervention required!")
                print(f"   Branch: {merge_branch_name}")
                print(f"   Conflicting commit: {commit}")
                print(f"   Commands to resolve:")
                print(f"   1. Resolve conflicts in your editor")
                print(f"   2. Run: git add .")
                print(f"   3. Run: git cherry-pick --continue")
                print(f"   4. After all commits are applied, verify and push")
                return False
        
        print()
        print(f"✅ Applied {successful_commits} commit(s), skipped {skipped_commits}")
        print()
        
        # Switch to merge branch
        git.switch_branch(merge_branch_name)
        
        # Summary
        print("=" * 60)
        print("✅ SUCCESS!")
        print("=" * 60)
        print(f"Merge branch: {merge_branch_name}")
        print(f"Game folder: {game_folder}")
        print(f"Commits applied: {successful_commits}")
        print()
        print("Next steps:")
        print(f"1. Review the changes: git log main..{merge_branch_name}")
        print(f"2. Test the game to ensure it works correctly")
        print(f"3. If satisfied, merge to main:")
        print(f"   git switch main")
        print(f"   git merge --no-ff {merge_branch_name}")
        print(f"4. Push to origin: git push origin main")
        print(f"5. Delete merge branch: git branch -d {merge_branch_name}")
        print(f"6. Delete temp branch: git branch -D {temp_branch}")
        print()
        
        # Cleanup temp branch
        git.switch_branch(merge_branch_name)
        git.delete_branch(temp_branch, force=True)
        
        return True
        
    except Exception as e:
        print(f"❌ Error: {e}")
        print("\nAttempting cleanup...")
        try:
            git.abort_cherry_pick()
            git.switch_branch(original_branch)
            git.delete_branch(temp_branch, force=True)
            if git.branch_exists(merge_branch_name):
                git.delete_branch(merge_branch_name, force=True)
        except:
            pass
        return False


def main():
    """Main entry point."""
    if len(sys.argv) < 4:
        print("Usage: python merge_game_contribution.py <contributor_url> <branch_name> <game_folder>")
        print()
        print("Example:")
        print("  python merge_game_contribution.py \\")
        print("    git@github.com:YhagoTomasini/GamutoWare.git \\")
        print("    Branch_Yhago_GL \\")
        print("    microjogos/2025S1/game_name")
        print()
        print("Arguments:")
        print("  contributor_url  - Git URL of the contributor's fork")
        print("  branch_name      - Branch name in the contributor's fork")
        print("  game_folder      - Relative path to the game folder in microjogos/")
        sys.exit(1)
    
    contributor_url = sys.argv[1]
    contributor_branch = sys.argv[2]
    game_folder = sys.argv[3]
    repo_path = sys.argv[4] if len(sys.argv) > 4 else "."
    
    success = merge_game_contribution(
        repo_path=repo_path,
        contributor_url=contributor_url,
        contributor_branch=contributor_branch,
        game_folder=game_folder,
    )
    
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
