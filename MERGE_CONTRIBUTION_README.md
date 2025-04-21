# Game Contribution Merge Automation

Automates the process of merging game contributions from forks, filtering changes to only the game folder. Works on Windows, macOS, and Linux.

## Problem It Solves

When contributors fork the project and create a new game in `microjogos/year/game_name`:

1. **Unwanted changes outside the game folder** are automatically ignored
2. **Conflicts with project-wide files** (like `project.godot` in your case) are handled gracefully
3. **Main branch updates** are rebased in before applying game changes
4. **Manual conflict resolution** is only needed if actual game files conflict

## Quick Start

### Option 1: Interactive Method (Easiest)

```bash
python merge_contribution_interactive.py
```

The script will prompt you for:
- Contributor's fork URL
- Branch name in their fork
- Game folder path (e.g., `microjogos/2025S1/game_name`)

### Option 2: Command Line Arguments

```bash
python merge_game_contribution.py \
  git@github.com:YhagoTomasini/GamutoWare.git \
  Branch_Yhago_GL \
  microjogos/2025S1/GAME_NAME
```

## How It Works

1. **Updates main branch** - Pulls the latest from `origin/main`
2. **Fetches contributor's branch** - Gets their fork's code
3. **Analyzes commits** - Identifies which commits actually modify files in the game folder
4. **Creates merge branch** - Base from main with only game-folder changes
5. **Cherry-picks commits** - Applies only relevant commits
6. **Handles conflicts** - If conflicts occur, guides you to resolution

## Result

After successful merge:
- New branch: `merge_BRANCH_NAME` (ready to merge into main)
- Only changes in `microjogos/year/game_name` are included
- All other changes are ignored
- You can review and test before merging to main

## Usage Example: Yhago's Case

Your current situation with conflicts:

```bash
# This will now work without the project.godot conflict!
python merge_contribution_interactive.py

# Or with full command:
python merge_game_contribution.py \
  git@github.com:YhagoTomasini/GamutoWare.git \
  Branch_Yhago_GL \
  microjogos/2025S1/GAME_NAME_HERE
```

## What Happens If There's a Conflict

If there's a conflict in actual game files:

```
⚠️  MERGE CONFLICT: Manual intervention required!
   Branch: merge_Branch_Yhago_GL
   Conflicting commit: [commit hash]
   Commands to resolve:
   1. Resolve conflicts in your editor
   2. Run: git add .
   3. Run: git cherry-pick --continue
```

After resolving conflicts, continue with:

```bash
git add .
git cherry-pick --continue
```

## After Successful Merge

```bash
# Review the changes
git log main..merge_BRANCH_NAME

# Test the game in the editor

# Once satisfied, merge to main
git switch main
git merge --no-ff merge_BRANCH_NAME

# Push to origin
git push origin main

# Clean up
git branch -d merge_BRANCH_NAME
```

## Requirements

- Python 3.6+
- Git installed and in PATH
- You should be in the repository root directory

## Advanced: Custom Temporary Branch Prefix

If you want to use a different prefix for temporary branches:

```bash
python merge_game_contribution.py \
  git@github.com:YhagoTomasini/GamutoWare.git \
  Branch_Yhago_GL \
  microjogos/2025S1/game_folder \
  . \
  custom_prefix
```

## How to Integrate into Your Workflow

### For Windows Users (Create a batch file)

Save as `merge_contribution.bat`:

```batch
@echo off
python merge_contribution_interactive.py
pause
```

Then just double-click `merge_contribution.bat`

### For All Users (Create an alias)

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, or PowerShell profile):

```bash
alias merge-game="python /path/to/merge_game_contribution.py"
```

Then use:

```bash
merge-game git@github.com:USERNAME/REPO.git BRANCH_NAME microjogos/YEAR/GAME_NAME
```

## Troubleshooting

### "Not a git repository"

Make sure you run the script from the repository root:

```bash
cd /path/to/GamutoWare
python merge_contribution_interactive.py
```

### "You have uncommitted changes"

Commit or stash your changes first:

```bash
git add .
git commit -m "Your changes"
# or
git stash
```

### Script gets stuck on authentication

Make sure you have SSH keys configured or use HTTPS URLs:

```bash
# Instead of:
git@github.com:user/repo.git

# Use:
https://github.com/user/repo.git
```

### Cleanup if something goes wrong

```bash
# Abort any in-progress operations
git cherry-pick --abort
git rebase --abort
git merge --abort

# Go back to main
git switch main

# Delete problematic branches
git branch -D merge_*
git branch -D merge_temp_*
```

## Key Features

✅ **Cross-platform**: Works on Windows, macOS, Linux  
✅ **Folder-specific**: Only applies changes to the game folder  
✅ **Conflict aware**: Handles conflicts gracefully  
✅ **Main branch safe**: Never directly modifies main until you confirm  
✅ **Verbose output**: Clear status messages throughout the process  
✅ **Automatic cleanup**: Removes temporary branches after completion  

## Tips for Contributors

If you want to minimize merge conflicts, ask contributors to:

1. **Only modify files in their game folder**
2. **Avoid changing project.godot** (use .gitignore or let you handle it)
3. **Keep their fork updated** with main before pushing
4. **Use meaningful commit messages** 

You can add this to your `CONTRIBUTING.md`:

```markdown
## Merging Instructions

To merge a game contribution:

```bash
python merge_contribution_interactive.py
```

Then follow the prompts. The script will:
- Only include changes in your game folder
- Automatically rebase onto the latest main
- Ignore any changes outside your folder
```
