---
name: check-rsvps
emoji: "📨"
description: Finds event invitations in your email that still need a response
schedule: "monday 9am, friday 9am"
author: @davehappyminion
---

# Check RSVPs

Don't leave people hanging. This workflow scans your email and calendar for event invitations you haven't responded to yet, so nothing slips through the cracks.

## Steps

1. Use your **email skill** to search for recent event invitations, RSVPs, and "are you coming?" type messages from the past 2 weeks.
2. Use your **calendar skill** to cross-reference — check which invitations already have a calendar response (accepted, declined, tentative).
3. Flag any invitations that are still unanswered, especially those with upcoming deadlines.
4. Present the list sorted by urgency (closest deadline first).
5. For each one, ask the user if they'd like to accept, decline, or mark tentative, and send the response.

## Output Format

```
📨 Unanswered RSVPs

🔴 Needs response soon:
1. Amy's Birthday Party — Sat March 28, 7pm
   RSVP deadline: March 25 (5 days away)
   From: Amy Chen via Partiful

2. Team offsite dinner — Fri March 27, 6:30pm
   RSVP deadline: March 24 (4 days away)
   From: manager@work.com

🟡 No rush yet:
3. Neighborhood block party — April 12, 2pm
   RSVP deadline: April 5
   From: HOA newsletter
```

## Notes

- Check both personal and work email if the user has multiple accounts.
- Don't RSVP to anything without the user's explicit confirmation.
- If an RSVP deadline has already passed, still flag it — the user may want to reach out anyway.
- Look for invitations in common platforms: Evite, Partiful, Google Calendar, Outlook, Eventbrite.
