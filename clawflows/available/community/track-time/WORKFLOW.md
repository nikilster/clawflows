---
name: track-time
emoji: "⏱️"
description: Daily time audit — quick evening review of how you spent your day with categories and patterns
schedule: "8pm"
author: @davehappyminion
---

# Track Your Time

A brief evening check-in to review how you spent your day. Categorize your time and spot patterns over weeks.

## Steps

1. **Review today's calendar** — Use your **calendar skill** to pull all events and meetings from today. Note start and end times.

2. **Fill in the gaps** — Calendar events only show part of the picture. Ask the user what they did between meetings. Keep it quick — broad categories are fine.

3. **Categorize time** — Sort the day into buckets:
   - Work (meetings, focused work, email)
   - Personal (errands, chores, family)
   - Health (exercise, cooking, sleep)
   - Learning (reading, courses, practice)
   - Fun (hobbies, socializing, entertainment)
   - Other

4. **Show the breakdown** — Display a simple summary of hours per category.

5. **Note patterns** — If you've tracked multiple days, mention any emerging patterns (too many meetings, not enough downtime, etc.).

## Output Format

```
Time Check — [date]

Work:      5.5 hrs  ████████████░░░░░░░░
Personal:  2.0 hrs  ████░░░░░░░░░░░░░░░░
Health:    1.5 hrs  ███░░░░░░░░░░░░░░░░░
Learning:  1.0 hrs  ██░░░░░░░░░░░░░░░░░░
Fun:       2.0 hrs  ████░░░░░░░░░░░░░░░░
Other:     1.0 hrs  ██░░░░░░░░░░░░░░░░░░

Total tracked: 13 hrs

This week so far: averaging 6 hrs work, 1.5 hrs health.
That's a solid balance — keep it up.
```

## Notes

- This should take less than 2 minutes. Don't turn it into an interrogation.
- Rough estimates are perfectly fine. Nobody needs to-the-minute tracking.
- The goal is awareness, not optimization. Some "unproductive" time is healthy.
- If the user seems burned out, acknowledge it instead of pushing for more productivity.
- Track patterns over time rather than judging any single day.
