---
name: check-school-events
emoji: "🎒"
description: Weekly parent briefing on upcoming school events, deadlines, and schedule changes
schedule: "monday 8am"
author: @davehappyminion
---

# Check School Events

Scan school communications and compile a weekly briefing so parents never miss a field trip, early dismissal, or permission slip deadline.

## Steps

1. **Scan for school emails.** Use your **email skill** to search for recent messages from school addresses, PTA lists, or teacher newsletters from the past week.

2. **Extract key dates and events.** Pull out anything time-sensitive: upcoming events, permission slip deadlines, early dismissals, half-days, school closures, picture day, conferences, volunteer requests.

3. **Check the calendar.** Use your **calendar skill** to see if any of these events are already on the user's calendar. Flag anything that's missing.

4. **Present the weekly briefing.** Organize everything by date for the week ahead. Highlight anything that needs action (like signing a form or packing something special).

5. **Offer to add to calendar.** For any events not already on the calendar, offer to add them.

## Output Format

```
🎒 School Briefing — Week of March 23

This week:
  Mon 3/23: Normal schedule
  Tue 3/24: Science fair projects due
  Wed 3/25: Early dismissal (12:30 PM) ⚠️
  Thu 3/26: Normal schedule
  Fri 3/27: Spirit day — wear school colors

Action needed:
  - Sign field trip permission slip by Wednesday
  - Send $5 for book fair (this week only)

Want me to add the early dismissal to your calendar?
```

## Notes

- Support multiple children at different schools if needed.
- Only surface what's relevant and actionable. Don't repeat old news.
- If you can't find any school emails, let the user know and ask if they'd like to add a school email address to watch.
- Be mindful that school schedules are stressful for parents. Keep the tone calm and organized.
- Flag anything that requires money or supplies with enough lead time to prepare.
