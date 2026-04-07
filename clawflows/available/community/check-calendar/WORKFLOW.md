---
name: check-calendar
emoji: "📅"
description: Calendar review — scans the next 48 hours for events, detects conflicts, calculates travel time, and generates prep notes for each meeting.
author: @davehappyminion
schedule: "8am, 6pm"
---

# Check Calendar

Your 48-hour radar. Conflicts, prep needs, and heads-up for what's coming.

## 1. Fetch Upcoming Events

Using your **calendar skill**, pull events for the next 48 hours including:
- Event title and time
- Duration
- Location (physical or video link)
- Attendees
- Any notes or agenda

## 2. Detect Issues

### Conflicts
- **Overlapping events** — Two meetings at the same time
- **Double-booked** — Accepted both? Need to decline one

### Scheduling Problems
- **Back-to-back** — No gap between consecutive events (need buffer)
- **No lunch** — Meetings through 12-1pm
- **Marathon blocks** — 3+ hours of continuous meetings
- **Early/late** — Anything before 8 AM or after 6 PM

### Travel/Location Issues
- **Location change** — Different location from previous meeting, need travel time
- **Video vs in-person** — Mixed formats back-to-back

## 3. Generate Prep Notes

For each significant meeting, note:

### Attendee Context
- Who's attending (names, roles if known)
- Your relationship (manager, report, external, new contact)

### Meeting Type
- **1:1** — Review previous notes, pending items
- **External** — Research company/person, prep talking points
- **Group sync** — Check agenda, any pre-reads
- **All-hands** — Usually just attend, low prep

### Suggested Prep
- Documents to review
- Questions to prepare
- Pre-meeting messages to send

## 4. Present the Schedule

```
📅 Calendar Check — {Date} {Time}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TODAY — {Day}, {Date}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🟢 9:00 AM — Team Standup (15 min)
   📍 Video call · 👥 Engineering team

🟡 10:00 AM — 1:1 with Sarah (30 min)
   📍 Video call · 👤 Your manager
   ⚠️ Prep: Review Q2 goals discussion

🔴 2:00 PM — Client Call (1 hr)
   📍 Video call · 👥 External
   ⚠️ High stakes — decision meeting

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TOMORROW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{Tomorrow's events...}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ WARNINGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔴 CONFLICT: {Description}
🟡 Back-to-back 2-4pm — no buffer
🟢 Free blocks: Today 3-5pm

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Today: {X} meetings, {Y} hrs committed, {Z} hrs free
• Tomorrow: {X} meetings
• Prep needed: {N} meetings
```

## 5. Quick Actions

Offer to:
- **Add buffer** — Create breaks between back-to-backs
- **Decline** — Send regrets for conflicts
- **Set reminder** — "Remind me 15 min before client call"

## Notes

- Run morning and evening
- Priority indicators: 🔴 high-stakes, 🟡 prep-needed, 🟢 routine, ⚪ personal
- If no events: "Calendar clear for 48 hours — open road!"
