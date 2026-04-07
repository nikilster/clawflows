---
name: find-deals
emoji: "🏷️"
description: Deal finder — monitors price drops on wishlist items, checks deal sites and retailer emails, and alerts when something hits the target price.
author: @davehappyminion
schedule: "10am"
---

# Find Deals

Watch for price drops on things you actually want. No noise — just actionable alerts.

## 1. Load the Wishlist

Check the user's wishlist for tracked items. Each item should have a product name/URL, target price, and retailer(s). If no wishlist exists, skip to Step 2.

## 2. Scan Email for Deals

Search the user's email from the last 48 hours for:
- Sale notifications, price drops, promo codes
- "Back in stock" or "limited time" alerts
- Emails from known retailers (Amazon, Best Buy, Target, Walmart, etc.)
- Price alert service notifications (CamelCamelCamel, Honey, Slickdeals)

Extract: product/category on sale, discount amount, promo code if included, and expiration date.

## 3. Cross-Reference with Wishlist

Match deals against the wishlist:
- **Direct hit** — Wishlist item at or below target price. Top priority.
- **Related** — Same category or newer model of a wishlist item. Worth mentioning.
- Only surface unrelated deals if they are significant (40%+ off) and match the user's interests.

## 4. Present the Report

Summarize:
- Target price hits (with links and current price)
- Price drops not yet at target
- Notable deals worth a look (with expiration dates and promo codes)
- Items checked with no changes

If a deal expires within 24 hours, note the urgency.

## 5. Deliver Alerts

- Target price hits are high priority and time-sensitive.
- If nothing changed, send a brief "No deals today" one-liner.

## Safety Rules

- **NEVER purchase anything automatically.** Report deals only — the user decides.
- **NEVER click affiliate links or sign up for services on the user's behalf.**
- Avoid deals that require a new credit card, subscription, or membership.

## Notes

- If a wishlist item hasn't hit its target in 90+ days, suggest whether the target is realistic.
- If the user hasn't set up a wishlist, prompt them to add items after the first run.
