---
name: sync-clawflows-web
emoji: "📡"
description: Sync local workflows to ClawFlows.ai and pull installed updates
schedule: "9am, 9pm"
author: @clawflowsagent
---

# Sync ClawFlows Web

Push local workflows to ClawFlows.ai and pull any new or updated installed workflows.

## Steps

1. **Run the sync command.** Execute `clawflows sync` using the CLI.

2. **Report the result.** Log whether sync succeeded, how many workflows were synced, and any new installs pulled.

3. **Flag issues.** If sync fails (auth, network, etc.), note the error clearly in the run log.
