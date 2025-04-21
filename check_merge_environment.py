#!/usr/bin/env python3
"""
Diagnostic tool to verify the environment and preview what the merge will do.
"""

import sys
import subprocess
from pathlib import Path


def check_git():
    """Check if git is installed."""
    try:
        result = subprocess.run(["git", "--version"], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ Git: {result.stdout.strip()}")
            return True
    except FileNotFoundError:
        pass
    print("❌ Git: Not found. Please install Git.")
    return False


def check_python():
    """Check Python version."""
    version = f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"
    if sys.version_info >= (3, 6):
        print(f"✅ Python: {version}")
        return True
    print(f"❌ Python: {version} (need 3.6+)")
    return False


def check_repo():
    """Check if we're in a git repository."""
    git_dir = Path(".git")
    if git_dir.exists():
        print(f"✅ Repository: {Path.cwd()}")
        return True
    print("❌ Repository: Not a git repository")
    return False


def check_uncommitted():
    """Check for uncommitted changes."""
    try:
        result = subprocess.run(
            ["git", "status", "--porcelain"],
            capture_output=True,
            text=True,
            check=False,
        )
        if result.returncode == 0 and not result.stdout.strip():
            print("✅ Uncommitted changes: None")
            return True
        else:
            print("⚠️  Uncommitted changes: Found (must commit or stash before merging)")
            return False
    except:
        return False


def preview_merge(contributor_url, branch_name, game_folder):
    """Preview what commits will be merged."""
    try:
        # Fetch the branch
        print(f"\n📥 Fetching {branch_name} from {contributor_url}...")
        result = subprocess.run(
            ["git", "fetch", contributor_url, branch_name],
            capture_output=True,
            text=True,
            check=False,
        )
        
        if result.returncode != 0:
            print(f"❌ Failed to fetch: {result.stderr}")
            return False
        
        print("✅ Fetch successful")
        
        # Get commits in the game folder
        print(f"\n🔍 Analyzing commits in {game_folder}...")
        result = subprocess.run(
            [
                "git",
                "log",
                "main..FETCH_HEAD",
                "--format=%h %s",
                "--",
                game_folder,
            ],
            capture_output=True,
            text=True,
            check=False,
        )
        
        if result.returncode != 0:
            print(f"❌ Failed to analyze: {result.stderr}")
            return False
        
        commits = result.stdout.strip().split("\n") if result.stdout.strip() else []
        
        if not commits or (len(commits) == 1 and not commits[0]):
            print(f"⚠️  No commits found that modify {game_folder}")
            return False
        
        print(f"✅ Found {len(commits)} commit(s):")
        for commit in commits:
            if commit:
                print(f"   • {commit}")
        
        # Get files that will be added
        print(f"\n📄 Files to be merged:")
        result = subprocess.run(
            [
                "git",
                "diff",
                "--name-only",
                "main...FETCH_HEAD",
                "--",
                game_folder,
            ],
            capture_output=True,
            text=True,
            check=False,
        )
        
        if result.returncode == 0 and result.stdout.strip():
            files = result.stdout.strip().split("\n")
            for file in files:
                print(f"   • {file}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error: {e}")
        return False


def main():
    """Run diagnostics."""
    print("\n" + "=" * 70)
    print("🔧 GAME CONTRIBUTION MERGE - DIAGNOSTICS")
    print("=" * 70)
    print()
    
    # Check environment
    print("Checking environment...")
    checks = [
        check_python(),
        check_git(),
        check_repo(),
        check_uncommitted(),
    ]
    
    print()
    
    if not all(checks):
        print("\n❌ Some checks failed. Please fix the issues above.")
        sys.exit(1)
    
    print("\n✅ Environment OK!\n")
    
    # Optional: Preview merge
    preview = input("Preview a merge? (yes/no): ").strip().lower()
    if preview in ("yes", "y"):
        print()
        contributor_url = input("Contributor fork URL: ").strip()
        branch_name = input("Branch name: ").strip()
        game_folder = input("Game folder (e.g., microjogos/2025S1/game_name): ").strip()
        
        print()
        preview_merge(contributor_url, branch_name, game_folder)
    
    print("\n✅ Diagnostics complete!\n")


if __name__ == "__main__":
    main()
