---
name: build-packing-list
emoji: "🧳"
description: Generate a smart packing list based on your destination, weather, and activities
author: @davehappyminion
---

# Build a Packing List

Never forget your phone charger again. This workflow creates a personalized packing list based on where you're going, what you'll be doing, how long you'll be there, and what the weather will be like.

## Steps

1. Ask the user for: destination, travel dates, planned activities (beach, hiking, business meetings, sightseeing, etc.), and whether they're checking a bag or carry-on only.
2. Use your **browser skill** to check the weather forecast for the destination during those dates.
3. Build a categorized packing list tailored to the trip. Adjust quantities based on trip length and laundry access.
4. If carry-on only, flag anything that won't make it through security and suggest alternatives.
5. Present the list and ask if anything should be added or removed.

## Output Format

```
🧳 Packing List: Costa Rica (5 days, carry-on only)
   Weather: 80-88°F, afternoon rain showers

👕 Clothes:
- 4 lightweight t-shirts/tanks
- 2 pairs shorts
- 1 light rain jacket (doubles as windbreaker)
- 1 swimsuit
- 5 pairs underwear, 4 pairs socks
- Sandals + trail-ready sneakers

🧴 Toiletries (3-1-1 compliant):
- Travel sunscreen SPF 50
- Bug spray (travel size)
- Mini shampoo/conditioner
- Toothbrush, toothpaste, deodorant

🎒 Gear:
- Dry bag for rainforest hike
- Reusable water bottle (empty through security)
- Portable charger
- Universal adapter
```

## Notes

- Always check TSA/airline rules for carry-on restrictions when relevant.
- Suggest rolling clothes to save space for carry-on trips.
- If the user has the plan-trip workflow output, reference it for activity details.
- Remind the user about easy-to-forget items: medications, chargers, ID/passport, travel insurance docs.
