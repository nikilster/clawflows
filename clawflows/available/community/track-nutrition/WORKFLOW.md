---
name: track-nutrition
emoji: "🥗"
description: Evening nutrition check-in with weekly trends
schedule: "7pm"
author: kevinmarch
---

# Track Nutrition

Evening check-in on daily nutrition — protein and calories. Quick log, weekly trends, streak tracking.

## Configuration

User defines their targets in config:

```env
# config.env
PROTEIN_TARGET_GRAMS=100
CALORIE_TARGET=2000
CHECKIN_TIME=7pm
LOG_FILE=nutrition-log.csv
```

Defaults: 100g protein, 2000 calories.

## When to Run

- **Scheduled**: 7pm daily
- **On-demand**: User says "log nutrition" or "track food"

## 1. Prompt for Today's Log

Send a friendly check-in:

```
🥗 Nutrition Check-In

How'd you do today?

Quick log options:
- "120g protein, 1800 cal" — I'll log it
- "good" — Hit your targets
- "skip" — Not tracking today
- "+" — Add to previous entry

Or tell me what you ate and I'll estimate.
```

## 2. Parse the Response

**Numeric entry**: "100g protein, 1500 cal" → Log both values
**Relative entry**: "good", "hit target", "crushed it" → Log target values
**Food description**: "had a protein shake and chicken breast" → Estimate macros
**Skip**: Don't log, don't break streak (grace day)

### Estimation Mode

If user describes food, estimate using these methods:

#### Method 1: Nutritionix API (Free Tier)

Nutritionix offers a free API for natural language nutrition queries:

```
POST https://trackapi.nutritionix.com/v2/natural/nutrients
Headers:
  x-app-id: YOUR_APP_ID
  x-app-key: YOUR_API_KEY
Body: { "query": "1 chicken breast and a protein shake" }
```

Returns detailed nutrition data. Free tier: 200 requests/day.
Sign up: https://developer.nutritionix.com/

#### Method 2: USDA FoodData Central (Free, No Key)

USDA's free nutrition database:

```
GET https://api.nal.usda.gov/fdc/v1/foods/search?query=chicken+breast&api_key=DEMO_KEY
```

- Completely free, no registration required (DEMO_KEY works)
- Returns nutrition per 100g, you'll need to estimate portions
- Good for raw ingredients, less good for mixed dishes

#### Method 3: OpenFoodFacts (Free, Open Source)

Community-driven food database:

```
GET https://world.openfoodfacts.org/cgi/search.pl?search_terms=protein+bar&json=1
```

- Free, no API key needed
- Great for packaged foods with barcodes
- Less comprehensive for raw ingredients

#### Method 4: Estimation Heuristics

When APIs aren't available, use common values:

| Food | Protein | Calories |
|------|---------|----------|
| Chicken breast (6oz) | 54g | 280 |
| Protein shake (1 scoop) | 25g | 120 |
| Eggs (1 large) | 6g | 70 |
| Greek yogurt (1 cup) | 20g | 150 |
| Salmon (6oz) | 40g | 350 |
| Ground beef (4oz, 90% lean) | 23g | 200 |
| Tofu (1/2 block) | 20g | 180 |
| Black beans (1 cup) | 15g | 225 |
| Rice (1 cup cooked) | 4g | 200 |
| Bread (1 slice) | 3g | 80 |

Present estimate with breakdown:
```
Estimated from what you described:
- Chicken breast (6oz): 54g protein, 280 cal
- Protein shake: 25g protein, 120 cal
- Rice (1 cup): 4g protein, 200 cal

Total: 83g protein, 600 cal

Log this? (or adjust: "make it 90g protein")
```

## 3. Log the Entry

Store in a simple CSV or markdown file:

```csv
date,protein_g,calories,notes
2024-03-05,120,1850,good day
2024-03-04,95,2100,missed protein target
2024-03-03,110,1900,
```

Or markdown format:
```markdown
## 2024-03-05
- Protein: 120g ✅ (target: 100g)
- Calories: 1850 ✅ (target: 2000)
- Notes: Good day
```

## 4. Give Immediate Feedback

Based on the entry:

**Hit both targets**:
```
✅ Crushed it!
- Protein: 120g (target: 100g) 💪
- Calories: 1850 (target: 2000) ✅
🔥 5-day streak!
```

**Hit one, missed one**:
```
👍 Solid day!
- Protein: 95g — 5g shy ❌
- Calories: 1800 ✅
Close on protein! Tomorrow's a new day.
```

**Missed both targets**:
```
📊 Logged:
- Protein: 75g — 25g under target
- Calories: 2500 — 500 over target
No worries. Consistency > perfection.
```

**Skip**:
```
⏸️ Rest day logged. Streak preserved.
```

## 5. Weekly Summary (Sundays)

On Sundays (or after 7 days), generate a weekly report:

```markdown
# 🥗 Weekly Nutrition Report
Week of [Date]

## Protein
- Average: 105g/day (target: 100g) ✅
- Best day: Wednesday (140g)
- Days at target: 5/7

## Calories
- Average: 1,950/day (target: 2,000) ✅
- Range: 1,700 - 2,200
- Days at target: 6/7

## Streak
🔥 Current streak: 12 days
🏆 Longest streak: 21 days

## Trend
       Protein  Calories
Mon    ▅ 95g   ▇ 2100
Tue    ▇ 110g  ▅ 1800
Wed    █ 140g  ▆ 1950
Thu    ▆ 100g  ▅ 1850
Fri    ▇ 115g  ▆ 2000
Sat    ▅ 90g   █ 2200
Sun    ▆ 105g  ▅ 1900

## Notes
- Protein strong this week 💪
- Weekend calories trending higher — watch snacking
```

## 6. Streak Tracking

Track consecutive days of hitting BOTH protein and calorie targets:
- **Current streak**: Days in a row at or above protein target AND within calorie range
- **Longest streak**: All-time record
- **Grace days**: Skipped days don't break streak (1 per week max)

Celebrate milestones:
- 7 days: "🎯 One week strong!"
- 30 days: "🏆 One month! You're building a habit."
- 100 days: "💯 Triple digits!"

## 7. Smart Reminders

If user hasn't logged by 9pm:
```
Hey! Haven't heard from you today. Quick nutrition check?
(Reply "skip" to skip today)
```

If streak is at risk:
```
⚠️ 14-day streak on the line! How'd nutrition go today?
```

## Data Storage

Store logs in user's workspace:
- `nutrition-log.csv` — Raw data
- `nutrition-summary.md` — Weekly summaries

Keep it simple so user can review/export anytime.

## After Running

Confirm the log:
- "✅ Logged: [Xg protein, Y cal]"
- "[Streak] days and counting"
- Or weekly summary on Sundays
