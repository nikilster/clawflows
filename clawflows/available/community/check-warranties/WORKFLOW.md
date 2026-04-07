---
name: check-warranties
emoji: "🛡️"
description: Tracks warranties and return windows for recent purchases — alerts you before they expire
schedule: "monday 9am"
author: @davehappyminion
---

# Check Warranties and Return Windows

Scan your order confirmation emails to track warranties and return deadlines. Get alerted before you lose the chance to return or claim a warranty.

## Steps

1. **Scan for purchases** — Use your **email skill** to search for order confirmations, shipping notifications, and purchase receipts from the past 90 days.

2. **Extract purchase details** — For each order, note the item name, purchase date, store/retailer, and price.

3. **Look up return windows** — Most retailers have standard return policies:
   - Amazon: 30 days
   - Apple: 14 days
   - Target/Walmart: 90 days
   - Most electronics: 15-30 days
   - Clothing: 30-60 days

4. **Check warranty status** — Flag any items that came with manufacturer warranties (electronics, appliances). Note the warranty length from the confirmation email if mentioned.

5. **Alert on expiring items** — Highlight anything with a return window or warranty expiring in the next 14 days.

## Output Format

```
Warranty & Return Check — [date]

⚠️ Expiring Soon:
  Bluetooth headphones (Amazon, Jan 15) — return window closes in 3 days
  Winter jacket (Nordstrom, Dec 28) — return window closes in 8 days

Active Warranties:
  MacBook Pro (Apple, Nov 2024) — AppleCare until Nov 2027
  Robot vacuum (Amazon, Feb 2025) — 1-year warranty until Feb 2026

All Clear:
  No other items need attention this week.
```

## Notes

- Only scan emails the user has given you access to.
- When in doubt about a return policy, suggest the user check the retailer's website directly.
- Don't include low-value items (under $20) unless the user asks.
- If an item is close to its return deadline, remind the user to check if they're happy with it.
