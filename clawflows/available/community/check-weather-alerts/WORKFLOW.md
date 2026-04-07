---
name: check-weather-alerts
emoji: "🌦️"
description: Proactive weather alerts tied to your calendar — cross-references the forecast with your schedule to deliver actionable, context-aware weather warnings.
author: @davehappyminion
schedule: "7am, 3pm"
---

# Check Weather Alerts

Not just a forecast — cross-references weather with your schedule to surface things that actually matter.

## 1. Get the Forecast

Using your **weather skill**, pull the forecast for the user's location:

- **Current conditions** — temperature, humidity, wind, UV index
- **Hourly forecast** — next 12 hours, hour by hour
- **Alerts** — any NWS warnings, watches, or advisories
- **Overnight** — low temperature, precipitation chance, frost/freeze risk

For the 3pm run, focus on evening and next-morning forecast.

## 2. Get Today's Calendar

Using your **calendar skill**, pull today's events (or tomorrow's for the 3pm run). Classify each as:

- **Outdoor** — patio lunch, park meetup, run, golf, hike
- **Commute-dependent** — requires driving or walking
- **Indoor** — default, no weather impact

## 3. Cross-Reference Weather + Calendar

For each event, check the forecast at that specific time:

- **Rain/storms** during outdoor events — "Rain starts at 2pm, your outdoor lunch is at 12:30. You'll be fine, but bring an umbrella."
- **Extreme heat** (90F+) during outdoor activity — hydration reminder
- **High wind** (20+ mph) — relevant for cycling, outdoor dining
- **Snow/ice** during commute windows — flag with lead time
- **UV index above 7** — sunscreen reminder for outdoor events

## 4. Check for Household Alerts

Beyond calendar, flag things that affect home life:

- **Freeze warning** (below 32F) — "Bring in potted plants, protect outdoor pipes"
- **Severe storms** — "Close windows before the 4pm thunderstorms"
- **Extreme temperature swings** — "Starts at 40F, hits 75F — dress in layers"

## 5. Present the Alert

Only send if there's something actionable. If weather is unremarkable, send a brief all-clear.

### When there are alerts:

```
🌦️ Weather Alert — {Date}

⚠️ HEADS UP
🌧️ Rain starts ~2:00 PM (80% chance)
   → "Team Lunch at Blue Patio" is at 12:30 PM
   → Should finish before rain, but have a backup plan

🥶 Freeze tonight — low of 28°F
   → Bring in potted plants, cover outdoor faucets

📅 YOUR DAY BY WEATHER
  7 AM ☀️ 45°F    12 PM ⛅ 62°F    5 PM 🌧️ 55°F

🧥 GRAB: ☂️ Umbrella (rain by afternoon) | 🧤 Warm layers (tonight)
```

### When all clear:

```
🌦️ Weather — {Date}
☀️ Clear skies all day. High 72°F / Low 55°F.
No conflicts with your schedule. Enjoy!
```

## 6. Deliver

Send the alert via your **messaging skill**.

## Notes

- The 7am run covers the full day. The 3pm run covers evening + next morning.
- Don't send two alerts if nothing changed between runs.
- Be specific with timing — "rain at 2pm" beats "chance of rain."
- Severe weather (tornado, hurricane, ice storm) always triggers an alert, even with no calendar conflicts.
- Keep the tone helpful, not alarmist. Save urgency for genuinely dangerous conditions.
- If the user is traveling (calendar shows another city), check weather there.
