#!/usr/bin/env python3
"""Merge a single game folder from a student fork in a safe way.

This script:
- Requires a clean working tree.
- Starts from a base branch (default: master).
- Fetches a branch from a student's fork.
- Creates a temporary local branch at that fork branch tip.
- Creates a new implementation branch from the base branch.
- Copies only the requested game folder from the temp branch
  into the implementation branch.
- Commits those folder changes as a single commit.

It never rewrites existing history; it only creates new branches
and commits on top of your current repository.

Typical usage::

    python implementation_scripts/merge_fork_game_folder.py \
        git@github.com:StudentUser/GamutoWare.git \
        Branch_StudentGame \
        microjogos/2025S1/StudentGame
"""

import sys
from pathlib import Path
from typing import Optional
import os

# Add parent directory to path so we can import from repo root
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from implementation_scripts.merge_game_contribution import GitMergeManager  # type: ignore


def merge_fork_game_folder(
    repo_path: str,
    contributor_url: str,
    contributor_branch: str,
    game_folder: str,
    base_branch: str = "master",
    target_branch_name: Optional[str] = None,
    temp_branch_prefix: str = "fork_temp",
    impl_branch_prefix: str = "impl_from_fork",
) -> bool:
    """Create a branch that imports only one game folder from a fork.

    High-level steps:
    1. Ensure the working tree has no uncommitted changes.
    2. Switch to ``base_branch`` and (best effort) fast-forward from origin.
    3. Fetch ``contributor_branch`` from ``contributor_url`` into ``FETCH_HEAD``.
    4. Create a temporary branch pointing at ``FETCH_HEAD``.
    5. Create a new implementation branch from ``base_branch``.
    6. Restore only ``game_folder`` from the temporary branch into
       the implementation branch.
    7. Commit those changes.
    """

    git = GitMergeManager(repo_path)

    print("\n=== MERGE FORK GAME FOLDER ===")
    print(f"Repository        : {git.repo_path}")
    print(f"Base branch       : {base_branch}")
    print(f"Contributor URL   : {contributor_url}")
    print(f"Contributor branch: {contributor_branch}")
    print(f"Game folder       : {game_folder}")
    print()

    def switch_branch_uid_safe(branch: str) -> bool:
        """Switch branches, auto-stashing .uid files if needed."""
        try:
            git.switch_branch(branch)
            return True
        except RuntimeError as err:
            err_text = str(err)
            if "would be overwritten by checkout" in err_text and ".uid" in err_text:
                print("Checkout blocked by .uid changes; auto-stashing and retrying.")
                if git.stash_push_paths("auto-stash: .uid files for merge", [":(glob)**/*.uid"]):
                    uid_stash_count[0] += 1
                git.switch_branch(branch)
                return True
            raise

    def ensure_uid_clean() -> bool:
        """Ensure only .uid changes are present; auto-stash them if needed."""
        dirty_paths = git.get_uncommitted_paths()
        if not dirty_paths:
            return True

        non_uid_paths = [path for path in dirty_paths if not path.endswith(".uid")]
        if non_uid_paths:
            print("ERROR: You have uncommitted changes. Commit or stash them first.")
            return False

        print("Uncommitted .uid files detected; auto-stashing to avoid checkout errors.")
        if git.stash_push("auto-stash: .uid files for merge"):
            uid_stash_count[0] += 1
        return True

    # Track how many auto-stashes were created so we can restore them later.
    uid_stash_count = [0]

    # 1. Ensure working tree is clean (auto-stash only .uid changes)
    if not ensure_uid_clean():
        return False

    original_branch = git.get_current_branch()

    # Normalize folder path to use forward slashes
    game_folder_norm = game_folder.replace("\\", "/").strip("/")

    # Derive target branch name if not provided
    if target_branch_name is None:
        folder_name = Path(game_folder_norm).name or "game"
        target_branch_name = f"{impl_branch_prefix}_{folder_name}"

    temp_branch = f"{temp_branch_prefix}_{contributor_branch}"

    try:
        # 2. Switch to base branch and try to update it from origin
        print(f"Switching to base branch '{base_branch}'...")
        if not ensure_uid_clean():
            return False
        switch_branch_uid_safe(base_branch)
        print("On base branch.")

        print("Trying to fast-forward base branch from origin (if configured)...")
        git.run_git(["pull", "--ff-only", "origin", base_branch], check=False)
        print("Base branch ready.\n")

        # 3. Fetch the contributor's branch
        print(f"Fetching contributor branch '{contributor_branch}' from fork...")
        git.fetch_remote(contributor_url, contributor_branch)
        print("Contributor branch fetched into FETCH_HEAD.\n")

        # 4. Create a temporary branch ref at FETCH_HEAD (no checkout)
        print(f"Creating temporary branch ref '{temp_branch}' from FETCH_HEAD...")
        git.create_branch_ref(temp_branch, "FETCH_HEAD", force=True)
        print("Temporary branch ref created.\n")

        # 5. Create the implementation branch from the base branch
        print(
            f"Creating implementation branch '{target_branch_name}' "
            f"from '{base_branch}'..."
        )
        git.create_branch(target_branch_name, base_branch, force=True)
        switch_branch_uid_safe(target_branch_name)
        print("Implementation branch created and checked out.\n")

        # 6. Restore only the game folder from the temp branch
        print(f"Importing game folder from '{temp_branch}': {game_folder_norm}")
        try:
            git.run_git_check(["restore", "-s", temp_branch, "--", game_folder_norm])
        except RuntimeError as err:
            print(f"ERROR: Could not restore game folder: {err}")
            return False
        print("Game folder restored into implementation branch.")

        # Check if anything actually changed
        status_code, status_out, _ = git.run_git(["status", "--porcelain"], check=False)
        if status_code != 0:
            print("ERROR: Could not read git status.")
            return False

        if not status_out.strip():
            print("WARNING: No changes detected after restoring the game folder.")
            print("         Nothing to commit; leaving implementation branch as-is.")
            return False

        # 7. Stage and commit only that folder
        print(f"Staging game folder '{game_folder_norm}'...")
        git.run_git_check(["add", game_folder_norm])

        commit_message = (
            f"Import game from fork {contributor_branch}: {game_folder_norm}"
        )
        print("Committing changes with message:")
        print(f"  {commit_message}")
        git.run_git_check(["commit", "-m", commit_message])

        print("\n=== SUCCESS ===")
        print(f"Implementation branch : {target_branch_name}")
        print(f"Imported game folder  : {game_folder_norm}")
        print()
        print("Next steps:")
        print(f"  1. Review the branch: git switch {target_branch_name}")
        print("  2. Test the game in Godot.")
        print(f"  3. Merge into {base_branch} when ready:")
        print(f"       git switch {base_branch}")
        print(f"       git merge --no-ff {target_branch_name}")
        print("  4. Push to origin and clean up temp branches if desired.")

        return True

    finally:
        # Best-effort: go back to whatever branch the user was on
        try:
            git.switch_branch(original_branch)
        except Exception:
            pass

        # Best-effort: delete the temporary branch
        try:
            git.delete_branch(temp_branch, force=True)
        except Exception:
            pass

        # Best-effort: restore any stashed .uid changes
        while uid_stash_count[0] > 0:
            try:
                git.stash_pop()
            except Exception:
                print("WARNING: Could not auto-apply stashed .uid changes.")
                break
            uid_stash_count[0] -= 1


def main() -> None:
    """Parse command-line arguments and run the merge."""

    if len(sys.argv) < 4:
        print(
            "Usage: python implementation_scripts/merge_fork_game_folder.py "
            "<contributor_url> <branch_name> <game_folder> [base_branch] "
            "[target_branch_name]"
        )
        print()
        print("Example:")
        print("  python implementation_scripts/merge_fork_game_folder.py ")
        print("      git@github.com:StudentUser/GamutoWare.git")
        print("      Branch_StudentGame")
        print("      microjogos/2025S1/StudentGame")
        sys.exit(1)

    contributor_url = sys.argv[1]
    contributor_branch = sys.argv[2]
    game_folder = sys.argv[3]
    base_branch = sys.argv[4] if len(sys.argv) > 4 else "master"
    target_branch_name = sys.argv[5] if len(sys.argv) > 5 else None

    success = merge_fork_game_folder(
        repo_path=".",
        contributor_url=contributor_url,
        contributor_branch=contributor_branch,
        game_folder=game_folder,
        base_branch=base_branch,
        target_branch_name=target_branch_name,
    )

    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
