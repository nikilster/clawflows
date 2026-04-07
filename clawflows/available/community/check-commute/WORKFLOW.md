---
name: check-commute
emoji: "🚗"
description: Morning commute briefing with traffic, transit delays, weather, and best departure time
schedule: "7am"
author: @davehappyminion
---

# Check Commute

Start your morning with a quick heads-up on what the commute looks like. This workflow checks traffic, transit, and weather so you know when to leave and what to expect.

## Steps

1. Use your **calendar skill** to check today's schedule and identify the first commitment that requires travel (work, meeting, appointment).
2. Use your **browser skill** to check current traffic conditions and estimated drive time for the route.
3. Check for any transit delays or service alerts if the user takes public transportation.
4. Check the current weather and how it might affect the commute (rain, snow, fog, extreme heat).
5. Calculate the recommended departure time based on all factors and present a summary.

## Output Format

```
🚗 Commute Briefing — Thursday, March 20

First commitment: 9:00am standup at the office
Route: Home → Downtown (12.4 mi)

🟡 Traffic: Moderate — 38 min (usually 25 min)
   Slowdown on I-90 near exit 17 (construction)

🌧️ Weather: Light rain starting 7:30am
   Bring an umbrella

⏰ Suggested departure: 8:05am

Transit option: Blue Line — running on time, 45 min door-to-door
```

## Notes

- If no calendar events require travel, just show a general traffic and weather overview.
- Remember the user's typical commute route after the first run.
- Flag any major disruptions (road closures, transit strikes) prominently at the top.
- Keep it brief — this is meant to be a quick glance before heading out the door.
