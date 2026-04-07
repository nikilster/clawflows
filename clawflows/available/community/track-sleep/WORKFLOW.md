---
name: track-sleep
emoji: "😴"
description: Evening sleep logger that tracks your rest and shows weekly trends
schedule: "9pm"
author: @davehappyminion
---

# Track Sleep

Help the user log their sleep each evening and spot patterns over time so they can improve their rest.

## Steps

1. **Ask about last night.** Ask the user what time they went to bed and what time they woke up. Also ask them to rate their sleep quality on a simple scale (great, okay, poor).

2. **Log the entry.** Use your **notes skill** to save the date, bedtime, wake time, total hours, and quality rating.

3. **Show a quick summary.** Tell them how many hours they got and how it compares to the recommended 7-9 hours.

4. **Once a week (Sunday),** show a weekly trends summary with average hours, best night, and any patterns you notice (like worse sleep on certain days).

5. **Offer a gentle tip.** If sleep has been consistently short or poor, share one simple, well-known sleep hygiene tip.

## Output Format

```
😴 Sleep Log — Thursday, March 19

Last night:
  Bedtime: 11:15 PM
  Wake up: 6:45 AM
  Total: 7.5 hours
  Quality: Okay

That's right in the healthy range — nice!

This week so far: averaging 7.2 hours/night.
```

## Notes

- Never diagnose sleep disorders. If the user reports consistent trouble sleeping, suggest they talk to a doctor.
- Accept approximate times — not everyone tracks to the minute.
- Keep the tone supportive. Poor sleep happens to everyone sometimes.
- Don't over-share tips. One small suggestion at a time is plenty.
- Respect that sleep schedules vary. Night owls and early birds are both fine.
