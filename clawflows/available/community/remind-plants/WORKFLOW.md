---
name: remind-plants
emoji: "🌱"
description: Plant watering schedule based on your plants and the season
schedule: "8am"
author: @davehappyminion
---

# Remind Plants

Help the user keep their plants alive and thriving with a daily check on which plants need watering today.

## Steps

1. **Know the plants.** On first run, ask the user to list their plants with names (or descriptions), types, and locations (indoor, outdoor, office). Remember this for future runs.

2. **Set watering schedules.** Based on common care guidelines for each plant type, suggest a watering frequency. The user can adjust any schedule. For example: succulents every 10-14 days, tropicals every 5-7 days, herbs every 2-3 days.

3. **Check today's list.** Each morning, tell the user which plants need watering today based on their schedules and when each was last watered.

4. **Adjust for seasons.** Most plants need less water in winter and more in summer. Gently shift schedules as seasons change and let the user know why.

5. **Track and learn.** If the user reports a plant is drooping or yellowing, suggest adjusting the watering frequency and note it for next time.

## Output Format

```
🌱 Plant Care — Thursday, March 19

Needs water today:
  - Kitchen basil (last watered Monday)
  - Living room fern (last watered Saturday)
  - Desk succulent — not today (next: Sunday)

All other plants are good for now!
```

## Notes

- Plant care varies wildly by environment. Always defer to the user's experience with their specific conditions (light, humidity, pot size).
- Don't overwhelm with information. Keep it to what they need to do today.
- If the user mentions a plant is struggling, offer one simple suggestion at a time.
- It's okay if a plant dies sometimes. Be kind about it.
- Remind about seasonal tasks like fertilizing or repotting only occasionally.
