---
name: clean-docker
emoji: "🐳"
description: Docker cleanup — prunes dangling images, stopped containers, unused volumes and networks. Shows disk savings. Always asks before deleting.
author: @davehappyminion
---

# Clean Docker

Audit the local Docker environment for waste and reclaim disk space. Always asks before deleting anything.

## 1. Verify Docker Is Running

If Docker is not running or not installed, stop and report the issue.

## 2. Capture Current Disk Usage

Check Docker's disk usage across images, containers, volumes, and build cache. Save these numbers for a before/after comparison.

## 3. Inventory Waste

Find and list:
- **Stopped containers** — with name, image, how long ago they stopped, and size. Flag containers stopped 7+ days ago as safe to remove.
- **Dangling images** — untagged images with size and age.
- **Unused volumes** — volumes not attached to any container.
- **Unused networks** — custom networks with no connected containers (exclude default bridge/host/none).
- **Build cache** — total reclaimable size.

## 4. Present Findings and ASK for Approval

Show a summary of everything found and how much space each category would free.

**STOP HERE.** Ask the user which categories to clean:
- Remove stopped containers?
- Remove dangling images?
- Remove unused volumes? (warn: **data loss** — volume data is permanent)
- Remove unused networks?
- Prune build cache?

## 5. Execute Cleanup (Only After Approval)

Run cleanup only for the categories the user approved. After cleanup, check disk usage again and report the before/after comparison showing space freed.

## Safety Rules

- **Never delete anything without explicit user approval.**
- Do NOT use `docker system prune -a` — it is too aggressive.
- Volumes are the most dangerous to prune. Database data and app state live in volumes. Always warn clearly.
- On macOS, Docker runs in a VM. Freed space may not immediately reflect on the host.

## Notes

- On-demand only, no schedule.
- If Docker Desktop is running, some resources may be managed by Desktop's own garbage collection.
