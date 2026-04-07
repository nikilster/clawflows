---
name: track-water
emoji: "💧"
description: Daily hydration check-ins to help you drink enough water
schedule: "9am, 12pm, 3pm, 6pm"
author: @davehappyminion
---

# Track Water Intake

Help the user stay hydrated throughout the day by checking in on their water intake and encouraging them to reach their daily goal.

## Steps

1. **Ask about intake so far.** Ask the user how many glasses (or bottles) of water they've had today. Keep it casual and friendly.

2. **Compare against their goal.** The default goal is 8 glasses per day. If the user has set a custom goal, use that instead. Calculate how many more they need to hit their target.

3. **Give a gentle nudge.** If they're behind pace for the time of day, encourage them warmly. If they're on track or ahead, celebrate briefly.

4. **Log the check-in.** Use your **notes skill** to record the timestamp and current count so you can track progress across check-ins.

5. **At the final check-in (6pm),** summarize the day's total and congratulate them or encourage them to finish strong before bed.

## Output Format

```
💧 Hydration Check-In — 12:00 PM

So far today: 3 glasses
Daily goal: 8 glasses
Remaining: 5 glasses

You're about halfway through the day — try to get a couple more
in before your next check-in!
```

## Notes

- Never shame the user for low intake. Always be encouraging.
- Accept any unit they give (glasses, bottles, oz, ml) and convert as needed.
- If the user mentions they don't like plain water, suggest alternatives like herbal tea or flavored water.
- Remember their goal across sessions if they set a custom one.
