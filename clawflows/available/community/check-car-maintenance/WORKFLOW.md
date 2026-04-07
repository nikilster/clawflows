---
name: check-car-maintenance
emoji: "🚗"
description: Monthly car care reminders — tracks oil changes, tire rotations, registration, inspections, insurance, and mileage milestones so nothing sneaks up on you.
author: @davehappyminion
schedule: "1st 9am"
---

# Check Car Maintenance

A monthly check-in on everything your car needs. Oil, tires, registration, insurance, inspections — all tracked so nothing expires or gets neglected.

## 1. Load Vehicle Info

Check for saved data at `~/.openclaw/data/car/vehicle.json`. If missing, ask: year/make/model, current mileage, average miles per month, last oil change date and mileage, registration renewal month, inspection due date, insurance renewal date. Save for future runs.

## 2. Check Maintenance Schedule

Based on current mileage and dates, flag anything due or coming up:

- **Oil change** — every 5,000-7,500 miles or 6 months
- **Tire rotation** — every 5,000-7,500 miles
- **Air filter** — every 15,000-30,000 miles
- **Brake inspection** — every 25,000 miles

Also flag renewals due in the next 60 days: registration, state inspection, insurance, emissions test.

## 3. Present the Report

```
🚗 Car Maintenance — March 2026

VEHICLE: 2022 Honda Civic | ~42,300 miles

✅ UP TO DATE
   Oil change — done at 40,100 mi. Next due ~45,000 mi (May)
   Tire rotation — done at 40,100 mi. Next due ~45,000 mi

⚠️ COMING UP
   Registration — expires April 30. Renew this month.
   Air filter — due around 45,000 mi. Do it with next oil change.

📅 LATER THIS YEAR
   Insurance renewal — August 15
   Brake inspection — around 50,000 mi (September)
```

## 4. Deliver

Send via your **messaging skill**. If anything is due within 14 days, mark as high priority.

## Notes

- This is a reminder system, not a mechanic. Defer to the owner's manual for exact intervals.
- Never estimate costs or recommend shops unless the user asks.
- Keep it brief. Most months, everything is fine. Don't pad the report.
- If this is the first run, walk through setup conversationally. Don't make it feel like a form.
