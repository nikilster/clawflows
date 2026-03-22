---
name: update-openclaw
emoji: 🔄
description: Daily self-update of OpenClaw — pull latest version and restart.
author: davehappyminion @davehappyminion
schedule: "3am"
---

# Update OpenClaw

Run the OpenClaw self-update process daily.

## 1. Record Current Version

Check the current version:
```
openclaw --version
```

## 2. Check If Update Is Available

```
openclaw update status
```

If already on the latest version, do nothing — reply `HEARTBEAT_OK`.

## 3. Run Update

Use the gateway tool to update and restart:

```
gateway tool: action=update.run, note="OpenClaw updated from <old_version>. Restarting now."
```

This pulls the latest code, restarts the gateway, and delivers the note to the last active session after restart. The session will be killed by the restart — that's expected. The `note` ensures the user is notified.

**Do not** try to do anything after calling `update.run` — the restart will kill this session.
