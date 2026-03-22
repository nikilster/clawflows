---
name: track-time
emoji: 🕐
description: Parse a natural language message about an activity and log it as a time entry to the health dashboard.
author: davehappyminion @davehappyminion
trigger: manual
---

# Track Time

## Auth Setup
```bash
source ~/.openclaw/integrations/1password/1password.sh
HEALTH_TOKEN=$(op read "op://Dave The Minion/Health Dashboard API/credential")
```

## Steps

1. **Determine if this is a START, STOP, or full entry:**

   **START mode** — user says "start tracking [activity]":
   - Map the activity to a category
   - Call the **start timer** endpoint:
     ```bash
     curl -s -X POST "https://health-visualization.vercel.app/external/time/start" \
       -H "Authorization: Bearer $HEALTH_TOKEN" \
       -H "Content-Type: application/json" \
       -d '{"category":"<CATEGORY>","title":"<TITLE>"}'
     ```
   - This automatically stops any active timer and starts a new one
   - Confirm: "⏱️ Tracking [activity] starting now (HH:MM AM/PM)"

   **STOP mode** — user says "stop", "done", "stop tracking", etc.:
   - Call the **stop timer** endpoint:
     ```bash
     curl -s -X POST "https://health-visualization.vercel.app/external/time/stop" \
       -H "Authorization: Bearer $HEALTH_TOKEN"
     ```
   - Optionally send `{"end_at":"YYYY-MM-DDTHH:MM:SS"}` to override the stop time
   - Confirm with summary of what was tracked and duration

   **Full entry mode** — user provides activity with both start and end (or duration):
   - Parse all fields and submit directly:
     ```bash
     curl -s -X POST "https://health-visualization.vercel.app/external/time" \
       -H "Authorization: Bearer $HEALTH_TOKEN" \
       -H "Content-Type: application/json" \
       -d '{"category":"<CATEGORY>","title":"<TITLE>","start_at":"<START>","end_at":"<END>"}'
     ```

2. **Parse the user's message** to extract:
   - **Activity/title** — what they did
   - **Category** — map to one of: Health, Family, Life Goals, Friends, Work, Other
   - **Start time** — when it started (use today's date if not specified)
   - **End time** — when it ended (if duration given, calculate from start; if not specified, ask)

3. **Category mapping guidelines:**
   - Exercise, gym, meditation, sleep, walks → **Health**
   - Hanging out with family, calls with parents/sister → **Family**
   - Side projects, learning, personal goals → **Life Goals**
   - Hanging out with friends, social events → **Friends**
   - Alchemy, meetings, coding for work → **Work**
   - Getting ready, errands, chores, commuting → **Other**

4. **If any required field is ambiguous, ask the user.** Don't guess times — it's okay to ask "when did you start?" or "how long?"

5. **Confirm** the entry was logged with a brief summary (category, title, time range or "timer started").

## Other Endpoints

- **Get categories:** `GET /external/time/categories`
- **Get entries for a date:** `GET /external/time/entries?date=YYYY-MM-DD`

## Notes
- API base: `https://health-visualization.vercel.app`
- Auth: `Authorization: Bearer <token>` (token in 1Password: "Health Dashboard API" in Dave The Minion vault)
- Categories: Health, Family, Life Goals, Friends, Work, Other
- Use local times (NOT UTC) based on the user's current timezone
- Format: `YYYY-MM-DDTHH:MM:SS`
