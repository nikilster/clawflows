# Check Scheduled Workflows

Run every 15 minutes. Check which workflows are due and run them.

## 1. Get Current Time

Note the current time and date.

## 2. Read Enabled Workflows

Read `clawflows/clawflows/clawflows.json` — it's a JSON array of enabled workflow entries. Each entry has:
- `name`
- `schedule` (empty string for on-demand)
- `path` (relative to `clawflows/clawflows/`)

Skip entries where `schedule` is empty — they're on-demand only. The `schedule` field in `clawflows.json` is the source of truth (not the WORKFLOW.md frontmatter).

## 3. Parse Schedules

For each scheduled workflow, determine if it's due now. The schedule field can be:
- Specific times: `"7am"`, `"9am, 1pm, 5pm"`, `"5:14pm"`
- Intervals: `"every hour"`, `"every 2 hours"`, `"hourly"`
- Descriptive: `"morning"`, `"evening"`, `"twice a day"`

Use your judgment to interpret the schedule. A workflow is "due" if the current time matches or is within 15 minutes of a scheduled time.

## 4. Check Run History

All runs are logged to a single file: `system/runs.jsonl`. Each line is a JSON object with this shape:

```json
{"timestamp":"2026-04-19T09:00:12-04:00","workflow":"send-morning-briefing","trigger":"scheduled","scheduled_time":"09:00","output":"..."}
```

For each due workflow, check if a line exists in `runs.jsonl` for today with the same `workflow` and `scheduled_time`. If so, skip it (already ran this slot).

Quick check:
```bash
grep "\"workflow\":\"<name>\".*\"scheduled_time\":\"<HH:MM>\"" system/runs.jsonl | grep "\"timestamp\":\"<YYYY-MM-DD>"
```

## 5. Run Due Workflows

For each workflow that is due and hasn't run:

1. Read the full `WORKFLOW.md`
2. Execute it according to its instructions
3. Append one JSONL line to `system/runs.jsonl` describing what you did:

```bash
cat >> system/runs.jsonl << 'EOF'
{"timestamp":"<ISO timestamp now>","workflow":"<name>","trigger":"scheduled","scheduled_time":"<HH:MM>","output":"<what you actually did>"}
EOF
```

**The `output` field must describe the concrete user-facing actions you took.** Name the channel, target, and what was sent/changed. Examples:

- `"Sent morning briefing to Telegram 345754343: 65F NYC, 3 meetings, top goal ship clawflows v2."`
- `"Archived 8 junk emails, flagged 2 urgent (from Stripe, from landlord). No replies sent."`
- `"Turned off Lutron main lights, set Hue living room to dim red, started Sonos meditation playlist at volume 3."`
- `"No nudge sent. User on 'fix dave' timer, exercised today, aligned with goals."`
- `"Blocked: browser tool unavailable in this scheduler session. No DoorDash check performed."`

Do NOT write vague summaries like "ran workflow" or "checked email". Say what was sent, what was changed, and to whom.

**Important:** `scheduled_time` is the time slot the workflow was due (e.g. `"07:00"`), not the current time. If `send-morning-briefing` runs at 6:50 AM for its 7:00 AM slot, `scheduled_time` is `"07:00"`.

## 6. Report

If any workflows ran, briefly summarize what was executed.

If nothing was due, respond with `HEARTBEAT_OK`.

## Notes

- This runs every 15 minutes via cron
- Enabled workflows are listed in `clawflows/clawflows/clawflows.json`
- Only run workflows with a non-empty `schedule` field
- Respect the run history — don't double-run
