---
name: check-price-drops
emoji: "📉"
description: Monitors your wishlist items for price drops — scans promo emails and checks for deals on things you want
schedule: "9am"
author: @davehappyminion
---

# Check for Price Drops

Scan promotional emails and check for deals on items you're actually interested in buying. No random deals — just the stuff on your list.

## Steps

1. **Review wishlist** — Ask the user what items they're watching for price drops. If they've shared a list before, use that. Common examples: electronics, clothing, home goods, books, gifts.

2. **Scan promo emails** — Use your **email skill** to search for promotional emails, sale notifications, and price alert emails from the past 24 hours that mention any wishlist items.

3. **Check for matches** — Compare sale items against the wishlist. Note the current price, original price, and discount percentage.

4. **Use your browser skill** — For high-priority wishlist items, use your **browser skill** to quickly check current prices on major retailers if email results are thin.

5. **Report findings** — Share any price drops found, sorted by biggest discount first.

## Output Format

```
Price Drop Report — [date]

🔥 Deals Found:
  Sony WH-1000XM5 headphones — $278 (was $348, 20% off) at Amazon
  Running shoes (Nike Pegasus) — $89 (was $130, 31% off) at Nike.com

No Change:
  iPad Air — still $599
  Standing desk — still $449

No deals found for: coffee maker, winter boots
```

## Notes

- Only track items the user has explicitly asked about. Don't surface random deals.
- If a deal seems too good to be true, mention that the user should verify before buying.
- Remember the user's wishlist between runs so they don't have to repeat it.
- Keep it brief — this is a quick morning check, not a shopping marathon.
