#!/usr/bin/env python3
"""Game Contribution Merge Automation Script.

Merges game contributions while filtering changes to only the game folder.
Works across Windows, macOS, and Linux.
"""

import os
import sys
import subprocess
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

    def stash_push(self, message: str = "auto-stash") -> bool:
        """Stash current changes. Returns True if something was stashed."""
        code, stdout, _ = self.run_git(["stash", "push", "-m", message], check=False)
        return code == 0 and "No local changes" not in stdout

    def stash_pop(self) -> None:
        """Pop the most recent stash."""
        self.run_git_check(["stash", "pop"])

    def create_branch(self, branch: str, start_point: str = "master", force: bool = False) -> None:
        """Create a new branch.
        
        Args:
            branch: Name of the branch to create
            start_point: Starting point for the new branch
            force: If True, delete existing branch and create new one
        """
        if force and self.branch_exists(branch):
            self.delete_branch(branch, force=True)
        cmd = ["switch", "-c", branch, start_point]
        self.run_git_check(cmd)

    def switch_branch(self, branch: str, force: bool = False) -> None:
        """Switch to a branch.
        
        Args:
            branch: Name of the branch to switch to
            force: If True, discard local changes when switching
        """
        cmd = ["switch", branch]
        if force:
            cmd.insert(1, "--force")
        self.run_git_check(cmd)

    def delete_branch(self, branch: str, force: bool = False) -> None:
        """Delete a branch."""
        cmd = ["branch", "-D" if force else "-d", branch]
        self.run_git(cmd, check=False)

    def fetch_remote(self, remote_url: str, branch: str) -> None:
        """Fetch a specific branch from remote."""
        self.run_git_check(["fetch", remote_url, branch])

    def get_commits_in_folder(self, branch: str, folder: str, base: str = "master") -> List[str]:
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

    def cherry_pick(self, commit: str) -> bool:
        """Cherry-pick a commit. Returns False if conflicts."""
        code, _, stderr = self.run_git(["cherry-pick", commit], check=False)
        if code != 0:
            if "CONFLICT" in stderr or "conflict" in stderr.lower():
                return False
            raise RuntimeError(f"Cherry-pick failed: {stderr}")
        return True

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
            folder_normalized = folder.replace("\\", "/").strip("/")
            return [
                f
                for f in files
                if f.replace("\\", "/").startswith(folder_normalized + "/")
                or f.replace("\\", "/") == folder_normalized
            ]
        except RuntimeError:
            return []

    def reset_hard(self, ref: str = "HEAD") -> None:
        """Hard reset to a reference."""
        self.run_git_check(["reset", "--hard", ref])
