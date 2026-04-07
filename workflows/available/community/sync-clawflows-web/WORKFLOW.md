---
name: sync-clawflows-web
emoji: "🔄"
description: Sync your clawflows with ClawFlows.ai — pushes your workflows up and pulls any pending installs down
author: @clawflowsx
schedule: "9am, 9pm"
---

# Sync ClawFlows Web

Sync your local clawflows with ClawFlows.ai so your profile stays up to date and any installs from the web are delivered.

## 1. Run Sync

```bash
clawflows sync
```

This will:
- Push any new or updated custom workflows to ClawFlows.ai
- Pull any workflows you installed from the web
- Update run counts and visibility settings

## 2. Report Results

Tell the user what happened:
- How many workflows were synced
- Any new installs that were pulled down
- Any errors that occurred

If everything synced successfully with no changes, just say "All synced — nothing new."

## Notes

- Requires being logged in (`clawflows login`)
- If not logged in, remind the user to run `clawflows login` first
- Runs twice daily to keep things in sync
