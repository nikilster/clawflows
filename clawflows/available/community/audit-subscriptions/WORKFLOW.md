---
name: audit-subscriptions
emoji: "💳"
description: Weekly audit of subscriptions, bills, and receipts from email
schedule: "9am monday"
author: kevinmarch
---

# Audit Subscriptions

Scan email for subscriptions, bills, receipts, and recurring charges. Compile a weekly report, flag anomalies, and identify savings opportunities.

## When to Run

- **Scheduled**: Monday 9am (weekly review)
- **On-demand**: User asks "check my subscriptions" or "audit my bills"

## 1. Scan Email for Financial Notifications

Search email from the past 7 days (or 30 days for monthly view):

**Keywords to search**:
- "receipt", "invoice", "payment", "subscription"
- "charged", "billing", "renewal", "auto-pay"
- "order confirmation", "purchase"
- From addresses: known subscription senders, banks, payment processors

**Common senders**:
- Subscription services (Netflix, Spotify, Adobe, etc.)
- SaaS tools (Notion, Figma, GitHub, etc.)
- Utilities (phone, internet, electric)
- Financial services (credit cards, banks)
- E-commerce (Amazon, etc.)

## 2. Extract Transaction Details

For each email, extract:
- **Service/Vendor name**
- **Amount charged**
- **Date of charge**
- **Billing frequency** (monthly, annual, one-time)
- **Account/card charged** (last 4 digits if shown)
- **Category** (software, entertainment, utilities, shopping)

Build a transaction list:
```
| Date | Vendor | Amount | Frequency | Category |
|------|--------|--------|-----------|----------|
| 3/1  | Netflix | $15.99 | Monthly | Entertainment |
| 3/2  | AWS | $47.23 | Monthly | Software |
```

## 3. Flag Anomalies

**🚨 Potential Issues**:

- **Unusual amounts**: Charge significantly higher than historical average
- **Duplicate subscriptions**: Multiple services doing same thing (2 cloud storage, etc.)
- **Price increases**: Subscription cost went up from last month
- **Unknown charges**: Vendor not recognized
- **Forgotten subscriptions**: Services not used recently (check last login if possible)
- **Failed payments**: Declined charges, retry notices
- **Free trial endings**: Trial expiring soon, will auto-charge

## 4. Calculate Totals

**Weekly Summary**:
- Total spent this week: $X
- vs. last week: +/-$Y

**Monthly Projection**:
- Recurring subscriptions: $X/month
- By category breakdown

**Annual Impact**:
- Total annual subscription cost: $X
- Highlight expensive annuals coming up for renewal

## 5. Identify Savings Opportunities

**Potential savings**:
- Unused subscriptions (candidates to cancel)
- Duplicate services (consolidate)
- Annual vs monthly (switch to annual for discount)
- Family/team plans (share with others)
- Competitor alternatives (cheaper options)
- Negotiation opportunities (call to reduce rate)

## 6. Generate Report

```markdown
# 💳 Subscription Audit: Week of [Date]

## 📊 This Week's Charges
| Date | Vendor | Amount | Category |
|------|--------|--------|----------|
| ... | ... | ... | ... |

**Total: $[X]** (vs $[Y] last week)

## 🚨 Flags

### ⚠️ Price Increase
- **[Service]**: Now $X/mo (was $Y)
- Increase: $Z/month, $[Annual] annually

### ❓ Unknown Charge
- **[Vendor]**: $X on [Date]
- Investigate: Legitimate or fraudulent?

### 💤 Possibly Unused
- **[Service]**: $X/mo — no detected usage in [X] days
- Action: Cancel or keep?

### 🔄 Duplicates Detected
- Cloud storage: Dropbox ($12) + iCloud ($3) + Google One ($3)
- Consider consolidating to one service

## 💰 Savings Opportunities

| Action | Service | Potential Savings |
|--------|---------|------------------|
| Cancel unused | [Service] | $X/mo |
| Switch to annual | [Service] | $X/yr |
| Downgrade plan | [Service] | $X/mo |

**Total potential savings: $[X]/month ($[Y]/year)**

## 📅 Upcoming

- **[Date]**: [Service] annual renewal ($X)
- **[Date]**: [Service] free trial ends (will charge $X)

## Quick Actions
Reply with:
- "cancel [service]" — I'll help you cancel
- "investigate [charge]" — Look into unknown charge
- "details [service]" — Show full history
```

## 7. Take Action

Based on user response:

**Cancel**:
- Find cancellation process for the service
- Guide user through steps or do it if possible
- Confirm cancellation and note savings

**Investigate**:
- Search for more context on the charge
- Check if it matches any known services
- If suspicious, draft dispute message to bank

**Track**:
- Add to a running subscription inventory
- Set reminder for annual renewals

## After Running

Summary:
- "💳 Weekly audit complete"
- "$[X] spent this week across [Y] services"
- "[Z] flags to review" (if any)
- "$[A] potential savings identified" (if any)
