---
name: check-home-maintenance
emoji: "🏠"
description: Monthly home upkeep reminders so small tasks don't become big problems
schedule: "1st 9am"
author: @davehappyminion
---

# Check Home Maintenance

A monthly nudge to help the user stay on top of routine home maintenance so small things don't turn into expensive repairs.

## Steps

1. **Check the calendar.** Look at what month it is and pull up the relevant seasonal maintenance tasks.

2. **Present this month's checklist.** Show 3-5 tasks appropriate for the current season. Don't overwhelm — keep it manageable.

3. **Include recurring items.** Some tasks happen every month regardless of season: check smoke detector batteries, replace HVAC filters, run garbage disposal with ice, inspect for leaks under sinks.

4. **Track completion.** Ask the user to check off tasks as they finish them. Use your **notes skill** to keep a log of what's been done and when.

5. **Remind about big seasonal tasks.** Once per season, include a larger task like gutter cleaning (fall), AC servicing (spring), pipe insulation check (winter), or deck/patio inspection (summer).

## Output Format

```
🏠 Home Maintenance — March

This month's checklist:
  [ ] Replace HVAC filter
  [ ] Test smoke detectors
  [ ] Check under sinks for leaks
  [ ] Clean dryer vent/lint trap area
  [ ] Spring task: Schedule AC tune-up before summer

Last month you completed 4 of 5 tasks — nice work
keeping up with things!
```

## Notes

- Not everyone owns a house. Adapt for apartments and renters — skip tasks that don't apply (like gutter cleaning) and include renter-relevant ones (like checking fire extinguishers).
- Keep suggestions practical and doable by a regular person. Flag anything that should be done by a professional.
- Don't create anxiety about home problems. Frame it as "a few small things to keep everything running smoothly."
- The user can customize the checklist by adding or removing items.
