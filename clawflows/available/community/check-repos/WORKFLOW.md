---
name: check-repos
emoji: "🔍"
description: Git repo health check — scans local repos for uncommitted changes, stale branches, and unpushed commits.
author: @davehappyminion
---

# Check Repos

Scan local git repos for uncommitted changes, stale branches, and unpushed commits.

## 1. Find Git Repos

Scan common code locations for git repositories:
- ~/Projects
- ~/Developer
- ~/Code
- ~/repos
- ~/src
- Home directory (shallow)

Skip dependency folders (node_modules, .cache, vendor, etc.).

## 2. Check Each Repo

For each repository found, check:

### Uncommitted Changes
- Modified files not staged
- Staged files not committed
- Untracked files

### Unpushed Commits
- Local commits not pushed to remote
- How many commits ahead of origin

### Stale Branches
- Branches already merged to main
- Branches with tracking gone (deleted on remote)
- Branches not touched in 30+ days

### Last Activity
- Date of most recent commit
- Flag repos inactive for 30+ days

## 3. Categorize Results

Group repos by status:
- **🔴 Needs attention** — uncommitted changes or unpushed commits
- **🟡 Has stale branches** — merged branches that can be cleaned up
- **🟢 Clean** — everything committed and pushed

## 4. Present Findings

```
🔍 Repo Health Check

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Repos scanned: 15
• Need attention: 3
• Have stale branches: 5
• Clean: 7

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔴 NEEDS ATTENTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
my-project/
  • 3 uncommitted files
  • 2 unpushed commits

api-server/
  • 1 staged file not committed

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🟡 STALE BRANCHES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
webapp/ — 4 merged branches
cli-tool/ — 2 branches with gone tracking
```

## Notes

- Don't make any changes — just report what you find
- Run weekly or before major work sessions
- Helps prevent losing work and keeps repos tidy
