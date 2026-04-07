---
name: plan-meals
emoji: "🍽️"
description: Weekly meal planner — generates a 7-day meal plan based on dietary preferences, seasonal ingredients, and calendar busyness, then outputs a grocery list.
author: @davehappyminion
---

# Plan Meals

Generate a practical weekly meal plan with a grocery list. Adapts to how busy each day looks and what's in season.

## 1. Load Preferences

Check for saved preferences at `~/.openclaw/data/meals/preferences.json`. If missing, ask the user and save for next time:

- **Dietary restrictions** — vegetarian, vegan, gluten-free, allergies
- **Household size** — how many people
- **Cooking skill** — beginner, comfortable, adventurous
- **Cuisines enjoyed** — Italian, Mexican, Asian, comfort food, etc.
- **Meals to plan** — breakfast, lunch, dinner, or just dinner?
- **Budget** — budget-friendly, moderate, no limit

## 2. Check the Calendar

Using your **calendar skill**, pull this week's schedule. For each day, assess busyness:

- **Packed day** (3+ meetings, late events) — "quick meal" night (30 min or less)
- **Normal day** — standard recipes (30-60 min)
- **Light day** — good for involved recipes
- **Social evening** (dinner plans out) — skip dinner planning

## 3. Check What's in Season

Based on the current month, identify seasonal produce. Prefer seasonal ingredients for freshness and cost. Winter: root vegetables, citrus, squash. Spring: asparagus, peas, strawberries. Summer: tomatoes, corn, berries. Fall: apples, pumpkin, sweet potatoes.

## 4. Generate the Meal Plan

Balance variety, prep efficiency, and nutrition:

- Don't repeat proteins or cuisines on consecutive days
- Plan batch-cook ingredients that carry over (roast chicken Monday, chicken tacos Wednesday)
- Bigger portions on light days so busy days can use leftovers
- For each meal: name, prep+cook time, difficulty, key seasonal ingredient

## 5. Present the Meal Plan

```
🍽️ Meal Plan — Week of {Start Date}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MONDAY — Normal day
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🌅 Breakfast: Overnight oats with seasonal berries
  🥗 Lunch:     Roasted squash and feta grain bowl
  🍲 Dinner:    Lemon herb roast chicken with root veg (60 min)
               ↳ Make extra chicken for Wednesday

TUESDAY — Packed day ⚡
  🌅 Breakfast: Greek yogurt + granola
  🥗 Lunch:     Leftover chicken wrap
  🍲 Dinner:    One-pot pasta with kale and sausage (25 min)

... (all 7 days)

📊 Quick meals: 3 | Standard: 3 | Involved: 1
   Leftover nights: 2 | Seasonal highlights: squash, kale, citrus
```

## 6. Generate Grocery List

Compile all ingredients, grouped by store section:

```
🛒 Grocery List

PRODUCE: □ Butternut squash (1) □ Kale (2 bunches) □ Lemons (4) ...
PROTEIN: □ Whole chicken (4 lbs) □ Italian sausage (1 lb) ...
DAIRY:   □ Feta (4 oz) □ Greek yogurt (32 oz) ...
PANTRY (skip if stocked): □ Olive oil □ Pasta (1 lb) □ Oats ...
```

## 7. Save and Deliver

Save the plan to `~/.openclaw/data/meals/plan-{date}.md` and send via your **messaging skill**.

## Notes

- Ask before replacing an existing plan for the same week.
- If the user says "I already have chicken in the freezer," adjust accordingly.
- Skip planning for nights with dinner reservations or social events.
- Keep quick meals genuinely quick — 30 min max, minimal dishes.
- This is a suggestion, not a mandate. The user can swap days freely.
- Check past plans to avoid repeating the same meals week to week.
