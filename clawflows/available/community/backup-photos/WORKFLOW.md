---
name: backup-photos
emoji: "📷"
description: Organize and deduplicate photos from Desktop, Downloads, and common locations. Sort by date, separate screenshots from real photos, identify duplicates. Always asks before deleting.
author: @davehappyminion
---

# Backup Photos

Find, organize, and deduplicate photos scattered across the filesystem.

## 1. Scan Source Locations

Search these directories for image and video files (jpg, png, heic, raw, mov, mp4, etc.):
- `~/Desktop`, `~/Downloads`, `~/Documents/Photos`, `~/Pictures`
- Any additional paths the user specifies

Report: total files found, breakdown by location, total size, and date range.

## 2. Classify Files

Categorize each file:
- **Photos** — Real camera/phone photos (has EXIF camera data)
- **Screenshots** — Screen captures (screen dimensions, "Screenshot" filenames)
- **Downloads** — Images from the web (no camera EXIF)
- **Videos** — Video files co-located with photos
- **Unknown** — Cannot classify confidently

Present the classification summary before proceeding.

## 3. Detect Duplicates

Identify duplicate files:
- Exact duplicates (identical content by hash)
- Cross-format duplicates (same photo as HEIC + JPG, or RAW + JPG)

For each duplicate group, prefer the highest-resolution version with intact metadata.

## 4. Propose Organization

Suggest a target structure like `~/Pictures/Organized/` with subfolders for Photos (by year/month), Screenshots, Videos, and a Duplicates staging folder. Ask the user to confirm or customize.

## 5. Present Action Plan

Show a summary of what will happen: files by category, duplicates found, and space impact. **Do NOT proceed without explicit user confirmation.**

## 6. Execute

Once approved:
1. Copy (not move) files to the new structure
2. Verify copies succeeded before removing originals
3. Move duplicates to the staging folder — do NOT delete them
4. Report progress for large batches

## 7. Final Report

Summarize: files organized, duplicates staged for review, any errors. Remind the user to review the Duplicates folder.

## Safety Rules

- **NEVER delete any file without explicit permission.** Duplicates go to a staging folder.
- **NEVER overwrite an existing file.** Append a suffix on name conflicts.
- **Always copy-then-verify-then-remove.** Protect against interrupted operations.
- **Preserve all EXIF metadata.**
- Do not process files in system directories (`/Library`, `/System`).
- If total files exceed 10,000, confirm the user wants to proceed.

## Notes

- On-demand only, no schedule.
- HEIC-to-JPG conversion can be offered but not done by default.
- This workflow is local filesystem only — no cloud uploads.
