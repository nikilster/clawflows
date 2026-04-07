---
name: sync-dotfiles
emoji: "📦"
description: Dotfiles backup — commits dotfiles and package manager config to a git repo for safekeeping.
author: @davehappyminion
---

# Sync Dotfiles

Backup dotfiles and system config to a git repo.

## 1. Locate Dotfiles Repo

Check common locations for an existing dotfiles repo:
- ~/dotfiles
- ~/.dotfiles
- ~/Projects/dotfiles

If no repo exists, ask the user where to create one.

## 2. Sync Shell Config

Copy current shell configuration:
- `.zshrc`, `.bashrc`
- `.zprofile`, `.bash_profile`
- `.aliases`, `.functions`

Strip any secrets or tokens before copying.

## 3. Sync Git Config

Copy git configuration:
- `.gitconfig`
- `.gitignore_global`

## 4. Sync Package Manager

Export installed packages:

### macOS (Homebrew)
Export Brewfile with all installed packages, casks, and taps.

### Linux (apt/dnf/pacman)
Export package list.

### Node.js
List global npm packages.

### Python
List pip packages (or export requirements.txt).

## 5. Sync Other Configs

Copy other useful configuration files:
- SSH config (not keys!)
- Vim/Neovim config
- Tmux config
- Editor settings (VS Code, etc.)

## 6. Commit and Push

Using **git**, commit the changes:
- Add all modified files
- Commit with date: "dotfiles sync YYYY-MM-DD"
- Push to remote

## 7. Report

```
📦 Dotfiles Sync

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SYNCED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Shell config (zshrc, zprofile)
✅ Git config
✅ Brewfile (145 packages)
✅ SSH config
✅ Vim config

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 CHANGES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• zshrc — 3 lines added
• Brewfile — 2 new packages
• gitconfig — unchanged

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ COMMITTED & PUSHED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit: abc1234
Message: "dotfiles sync 2026-02-10"

Your configs are backed up!
```

## Notes

- **Never sync files containing secrets** (.env, API keys, tokens, SSH private keys)
- Check `.gitignore` in the dotfiles repo excludes sensitive files
- Schedule weekly for automatic backup
- Use symlinks to link dotfiles repo to actual locations
