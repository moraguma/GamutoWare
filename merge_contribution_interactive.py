#!/usr/bin/env python3
"""
Interactive version of the game contribution merge script.
Prompts the user for all required information.
"""

import sys
import os
from pathlib import Path

# Add the repo root to path to import merge script
sys.path.insert(0, str(Path(__file__).parent))

from merge_game_contribution import merge_game_contribution, GitMergeManager


def get_input(prompt: str, default: str = None) -> str:
    """Get input from user with optional default."""
    if default:
        display_prompt = f"{prompt} [{default}]: "
    else:
        display_prompt = f"{prompt}: "
    
    value = input(display_prompt).strip()
    return value or default


def main():
    """Interactive merge process."""
    print("\n" + "=" * 70)
    print("🎮 GAME CONTRIBUTION MERGE TOOL")
    print("=" * 70)
    print()
    
    # Check if we're in a git repo
    try:
        git = GitMergeManager(".")
        print(f"✅ Repository: {git.repo_path}")
    except ValueError as e:
        print(f"❌ Error: {e}")
        sys.exit(1)
    
    print()
    print("Enter the contributor's information:")
    print()
    
    # Get contributor URL
    contributor_url = get_input(
        "Contributor's fork URL",
        "git@github.com:YhagoTomasini/GamutoWare.git"
    )
    
    # Get branch name
    branch_name = get_input(
        "Branch name in contributor's fork",
        "Branch_Yhago_GL"
    )
    
    # Get game folder
    game_folder = get_input(
        "Game folder path (relative, e.g., microjogos/2025S1/game_name)"
    )
    
    if not game_folder:
        print("❌ Game folder is required!")
        sys.exit(1)
    
    print()
    print("Configuration:")
    print(f"  Contributor URL: {contributor_url}")
    print(f"  Branch: {branch_name}")
    print(f"  Game folder: {game_folder}")
    print()
    
    # Confirm
    confirm = input("Proceed with merge? (yes/no): ").strip().lower()
    if confirm not in ("yes", "y"):
        print("Cancelled.")
        sys.exit(0)
    
    print()
    
    # Run merge
    success = merge_game_contribution(
        repo_path=".",
        contributor_url=contributor_url,
        contributor_branch=branch_name,
        game_folder=game_folder,
    )
    
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
