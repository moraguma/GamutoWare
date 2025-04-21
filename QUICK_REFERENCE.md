# Game Contribution Merge Tool - Quick Reference

## 🚀 Quick Start

### Windows Users
Just double-click: `merge_contribution.bat`

### macOS/Linux Users
```bash
python merge_contribution_interactive.py
```

### Command Line (Any OS)
```bash
python merge_game_contribution.py \
  git@github.com:USERNAME/GamutoWare.git \
  BRANCH_NAME \
  microjogos/YEAR/GAME_FOLDER
```

---

## 📋 Files Included

| File | Purpose |
|------|---------|
| `merge_game_contribution.py` | Main script (command-line) |
| `merge_contribution_interactive.py` | Interactive version (prompts for input) |
| `check_merge_environment.py` | Diagnostic tool |
| `merge_contribution.bat` | Windows double-click executable |
| `check_environment.bat` | Windows diagnostic executable |
| `MERGE_CONTRIBUTION_README.md` | Full documentation |

---

## ✨ What It Does

```
Your fork with changes          Your main branch
├─ project.godot (deleted)     ├─ project.godot (exists) ✅
├─ new_features (outside)      └─ script.gd
└─ microjogos/
  └─ 2025S1/game_name/
    ├─ game.gd ✅ (KEPT)
    └─ scene.tscn ✅ (KEPT)
                                    ↓ MERGE MAGIC ↓
                            
                        Result on main branch
                        ├─ project.godot (unchanged) ✅
                        ├─ script.gd (unchanged) ✅
                        └─ microjogos/
                          └─ 2025S1/game_name/
                            ├─ game.gd (merged) ✅
                            └─ scene.tscn (merged) ✅
```

---

## 🎮 Usage Example: Merging Yhago's Game

```bash
# Option 1: Interactive
python merge_contribution_interactive.py

# Follow prompts:
# > Contributor's fork URL: git@github.com:YhagoTomasini/GamutoWare.git
# > Branch name: Branch_Yhago_GL
# > Game folder: microjogos/2025S1/game_name
# > Proceed? yes

# Option 2: Command line
python merge_game_contribution.py \
  git@github.com:YhagoTomasini/GamutoWare.git \
  Branch_Yhago_GL \
  microjogos/2025S1/game_name
```

---

## ✅ Step-by-Step Flow

### What the Script Does Automatically

1. ✅ Updates main branch
2. ✅ Fetches contributor's branch
3. ✅ Analyzes commits in game folder
4. ✅ Creates a safe merge branch
5. ✅ Cherry-picks only game folder changes
6. ✅ Handles conflicts gracefully

### What You Do Manually (Optional)

```bash
# Review the merged changes
git log main..merge_BRANCH_NAME

# Test the game in Godot editor

# When satisfied, merge to main
git switch main
git merge --no-ff merge_BRANCH_NAME
git push origin main

# Clean up
git branch -d merge_BRANCH_NAME
```

---

## 🐛 Troubleshooting

### Error: "Not a git repository"
```bash
cd /path/to/GamutoWare  # Go to repo root
python merge_contribution_interactive.py
```

### Error: "Uncommitted changes"
```bash
git add .
git commit -m "Save changes"
# or
git stash
```

### Merge gets stuck (password prompt)
Use HTTPS instead of SSH:
```bash
# SSH (may prompt for password)
git@github.com:user/repo.git

# HTTPS (use if SSH gives issues)
https://github.com/user/repo.git
```

### Preview before merging
```bash
python check_merge_environment.py
# Select "yes" to preview
```

---

## 🎯 Why This Script is Better Than Manual Git

| Task | Manual Git | This Script |
|------|-----------|------------|
| Handle conflicts from project.godot | ❌ Manual | ✅ Automatic |
| Filter changes to folder | ❌ Complex | ✅ Automatic |
| Rebase & merge safely | ❌ Error-prone | ✅ Safe |
| Preserve commit history | ❌ Depends | ✅ Yes |
| Time to merge | 30 mins | 2 mins |

---

## 🔒 Safety Features

- ✅ Never modifies main until you confirm
- ✅ Creates temporary branches safely
- ✅ Automatic cleanup on completion
- ✅ Clear error messages
- ✅ Requires confirmation before starting

---

## 💡 For Team Members

### Add to your CONTRIBUTING.md

```markdown
## Submitting Your Game

1. Fork the repository
2. Create a branch: `git switch -c new-feature`
3. Add your game to `microjogos/2025S1/YOUR_GAME_NAME/`
4. Commit: `git commit -m "Add my game"`
5. Push: `git push origin new-feature`
6. Create a Pull Request

## For Maintainers: Merging Games

```bash
python merge_contribution_interactive.py
```

See [MERGE_CONTRIBUTION_README.md](MERGE_CONTRIBUTION_README.md) for details.
```

---

## 📞 Need Help?

1. **First time?** Run: `python check_merge_environment.py`
2. **Check logs:** `git log --oneline main..FETCH_HEAD`
3. **See what will change:** `git diff main...FETCH_HEAD -- microjogos/YEAR/GAME`
4. **Abort if needed:** `git merge --abort` or `git cherry-pick --abort`

---

## 🚀 Advanced: Using in Your Automation

```python
from merge_game_contribution import merge_game_contribution

success = merge_game_contribution(
    repo_path="/path/to/repo",
    contributor_url="git@github.com:user/fork.git",
    contributor_branch="feature-branch",
    game_folder="microjogos/2025S1/game_name",
)

if success:
    # Merge was successful
    # Now review and push
    print("Ready to merge!")
else:
    # Manual intervention needed
    print("Conflicts detected")
```

---

Created: 2025-02-06
Python: 3.6+
Platforms: Windows, macOS, Linux
No external dependencies required ✅
