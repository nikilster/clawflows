---
name: backup-important-files
emoji: "💾"
description: Weekly backup check — verifies your critical documents, photos, and files are backed up, and flags anything new that isn't protected yet.
author: @davehappyminion
schedule: "sunday 3am"
---

# Backup Important Files

A weekly check that your important stuff is actually backed up. Catches new files that aren't protected before something goes wrong.

## 1. Load Backup Profile

Check for config at `~/.openclaw/data/backups/config.json`. If missing, ask: where important files live, where backups go (external drive, cloud, both), and what's most important to protect. Save for future runs.

## 2. Check Backup Status

For each backup destination, verify it's working:

- **Cloud sync** (iCloud, Google Drive, Dropbox) — running? Any sync errors?
- **External drive** — connected? When did it last complete?
- **Time Machine** — enabled? Last backup time?

Flag anything that hasn't backed up in 7+ days.

## 3. Scan for Unprotected Files

Check important folders for: new files since last check, large files that may have been skipped, and files in locations outside the backup scope (Downloads, Desktop).

## 4. Present the Report

```
💾 Backup Check — Sunday, March 22

✅ PROTECTED
   iCloud — synced, last sync 2 hours ago
   Time Machine — last backup Saturday 11:30 PM

⚠️ NEEDS ATTENTION
   External drive — not connected since March 8
   12 new photos not yet in Google Photos

📁 NEW FILES NOT BACKED UP
   ~/Desktop/project-draft.docx — move to Documents
   ~/Downloads/insurance-renewal.pdf — move to Documents

💡 Move those files to Documents so they're covered automatically.
```

Send via your **messaging skill**. If critical files are unprotected, mark as high priority.

## Notes

- **NEVER move, copy, or modify files without permission.** This is a check, not an automatic backup.
- If backups are healthy, keep the report very short: "All good, nothing to worry about."
- The 3am schedule means this runs silently. Only surface the report if there's something to act on.
- If the user has no backup system at all, suggest starting with cloud sync — it's the easiest first step.
- Photos are usually the most irreplaceable thing. Prioritize those.
