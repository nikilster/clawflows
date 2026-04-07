---
name: check-deep-work
emoji: "🧘"
description: Protect deep work days from meeting creep
schedule: "8am"
author: kevinmarch
---

# Check Deep Work

Audit calendar on designated deep work days. Alert if someone booked over protected time and offer to reschedule or decline.

## Configuration

Define deep work days in config:

```env
# config.env
DEEP_WORK_DAYS=tuesday,thursday
PROTECTED_HOURS_START=9
PROTECTED_HOURS_END=17
EXCEPTIONS=standup,1:1 with manager
```

Default: Tuesdays and Thursdays, 9am-5pm protected.

## When to Run

- **Scheduled**: 8am on deep work days
- **On-demand**: User asks "check my deep work" or "audit my calendar"

## 1. Confirm It's a Deep Work Day

Check if today matches configured deep work days.
- If not a deep work day, exit with: "Today isn't a protected day. Deep work days: [list]"
- If user triggers manually, run anyway on any day

## 2. Pull Today's Calendar

Get all calendar events for today during protected hours:
- Meeting title
- Start and end time
- Duration
- Attendees
- Organizer (who booked it)
- Whether user accepted, tentative, or no response

## 3. Categorize Events

**Allowed** (don't flag):
- Events matching EXCEPTIONS (e.g., daily standup)
- Events the user created themselves
- All-day events (usually blockers)
- "Focus time" or "Deep work" blocks

**Violations** (flag these):
- External meetings booked by others
- Internal meetings during protected hours
- Recurring meetings that crept in
- Meetings user hasn't responded to

## 4. Assess Severity

For each violation:
- **Duration**: How much deep work time does it consume?
- **Movability**: Is this a 1:1 (easy to move) or a 20-person meeting?
- **Organizer relationship**: Manager vs. peer vs. external
- **Notice**: When was it booked? (Today = urgent, last week = planned)

## 5. Generate Report

```markdown
# 🧘 Deep Work Audit: [Day, Date]
Protected hours: [Start] - [End]

## ⚠️ Violations Found: [X]

### [Meeting Title] — [Duration]
- **Time**: [Start - End]
- **Organizer**: [Name]
- **Impact**: [X] hours of deep work blocked
- **Recommendation**: [Decline / Reschedule / Keep]

### [Next meeting...]

## ✅ Allowed Events: [X]
- [Standup] — [Time] (exception)
- [Focus block] — [Time] (your blocker)

## Summary
- Total protected time: [X] hours
- Time blocked by violations: [Y] hours
- Remaining deep work time: [Z] hours

## Quick Actions
Reply with:
- "decline all" — Decline all violations
- "decline [#]" — Decline specific meeting
- "reschedule [#]" — Propose new time
- "keep all" — Accept the violations today
```

## 6. Take Action

Based on user response:

**Decline**:
- Send decline with polite message: "I keep [Day] for focused work. Could we find a time on [alternative days]?"
- Remove from calendar

**Reschedule**:
- Check user's availability on non-deep-work days
- Propose 2-3 alternative times
- Draft reschedule message to organizer

**Keep**:
- Accept the meeting
- Note this as an exception

## 7. Proactive Protection (Optional)

If violations are frequent:
- Suggest adding calendar blocks ("Focus Time") during protected hours
- Recommend setting working hours in calendar settings
- Draft an auto-response for meeting requests on deep work days

## Prevention Tips

Share with user if meeting creep is chronic:
1. **Block the time**: Add recurring "Focus Time" events
2. **Set boundaries**: Update calendar working hours
3. **Communicate**: Tell your team which days are protected
4. **Decline fast**: The longer you wait, the harder to decline

## After Running

Summary:
- "🧘 Deep work check complete"
- "✅ No violations — [X] hours of uninterrupted focus today"
- Or: "⚠️ [X] meetings during protected time — see options above"
