---
name: rotate-logs
emoji: "📜"
description: Log rotation and hygiene — checks log files across projects and system locations, archives old logs, flags fast-growing files, and reports disk usage.
author: @davehappyminion
---

# Rotate Logs

Audit log files across project directories and system locations. Identify large or stale logs, offer to compress them, and report disk usage.

## 1. Scan for Log Files

Search these locations for `*.log`, `*.log.*`, and `logs/` directories:
- `~/.openclaw/logs/`
- `~/Library/Logs/` (macOS user logs)
- `/usr/local/var/log/` (Homebrew service logs)
- Project directories (`~/Projects`, `~/src`, `~/.openclaw/workspace`)
- Docker container logs if Docker is running

Do NOT scan: `/var/log/` (requires root), `node_modules`, `.venv`, `target`, or build directories.

## 2. Classify Log Files

For each log file, record its path, size, and last modified date. Then classify:
- **Critical** — Over 500 MB, or large and growing fast. Needs immediate attention.
- **Oversized** — Over 100 MB. Should be rotated or archived.
- **Stale** — Not modified in 30+ days and over 1 MB. Safe to archive.
- **Active** — Modified recently, reasonable size. Leave alone.
- **Already Rotated** — Files matching `*.log.gz`, `*.log.1`, etc. Informational.

## 3. Offer to Compress

For Stale and Oversized logs, offer to compress them with gzip (keeping the original).

**ASK the user before archiving.** Present the list and estimated space savings.

Do NOT delete originals unless the user explicitly asks.

## 4. Present Report

Summarize:
- Total log files found and disk usage by location
- Critical and oversized files that need attention
- Stale files that are safe to archive
- Space saved if compression was performed

## Notes

- This workflow does NOT delete files unless explicitly asked. Compression is the default safe action.
- Docker container logs can grow unbounded. If large Docker logs are found, suggest adding log rotation to the Docker daemon config.
- If `logrotate` is installed, check for existing rotation configs to avoid conflicts.
