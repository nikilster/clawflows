---
name: track-budget
emoji: "💰"
description: Weekly spending check — scans receipts and bank notifications to see where your money went
schedule: "friday 6pm"
author: @davehappyminion
---

# Track Your Weekly Budget

Review this week's spending by scanning email receipts and bank notifications, then compare against budget categories.

## Steps

1. **Gather transactions** — Use your **email skill** to search for order confirmations, receipts, and bank transaction alerts from the past 7 days.

2. **Categorize spending** — Sort each transaction into categories: groceries, dining out, transportation, subscriptions, shopping, entertainment, bills, and other.

3. **Compare to budget** — Check spending against these common monthly targets (adjust based on what you learn about the user's actual budget):
   - Groceries: $400/mo (~$100/week)
   - Dining out: $200/mo (~$50/week)
   - Subscriptions: $100/mo
   - Shopping: $150/mo (~$37/week)

4. **Flag overspending** — Highlight any category where weekly spending is on pace to exceed the monthly budget.

5. **Summarize and suggest** — Share the breakdown and one or two simple suggestions if spending is high somewhere.

## Output Format

```
Weekly Spending Report — [date range]

Category        | This Week | Monthly Pace | Budget
Groceries       | $87       | $348         | $400 ✅
Dining Out      | $64       | $256         | $200 ⚠️
Shopping        | $23       | $92          | $150 ✅
Subscriptions   | $15       | $60          | $100 ✅

Total this week: $189

Heads up: Dining out is running a bit high this month.
Maybe cook a couple extra meals this weekend to balance it out.
```

## Notes

- Only scan emails the user has given you access to. Never ask for bank login credentials.
- If you can't find enough data, let the user know and ask if they want to manually add transactions.
- Keep the tone friendly and non-judgmental — this is about awareness, not guilt.
- Budgets are personal. If the user shares their actual numbers, use those instead of defaults.
