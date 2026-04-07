---
name: check-bills
emoji: "🧾"
description: Bill monitor — scans email for upcoming bills and due dates, flags unusual amounts or spikes, and makes sure nothing gets missed before it's due.
author: @davehappyminion
schedule: "monday 8am"
---

# Check Bills

Stay ahead of every bill. Surface what is due soon, catch anything that looks off, and make sure nothing sneaks past.

## 1. Scan Email for Bills

Search the user's email from the last 45 days for bills and statements:
- Keywords: "bill", "statement", "amount due", "payment due", "invoice", "autopay"
- Known billers: utilities, insurance, rent/mortgage, credit cards, loans, streaming, memberships

Extract from each: biller name, amount due, due date, autopay status (if mentioned), and link to the full statement.

## 2. Build the Bill Calendar

Organize bills into groups:
- **Overdue** — Due date passed, no payment confirmation found
- **Due This Week** — Next 7 days
- **Due This Month** — Next 30 days
- **Autopay Scheduled** — Will process automatically

Sort each group by due date, soonest first.

## 3. Flag Anomalies

Call out anything that looks off:
- Bills due in 3 days without autopay (highest urgency)
- Significant amount increases compared to previous periods
- New billers that have not appeared before
- Missing bills from regular monthly billers
- Late fees or past-due warnings in email language

## 4. Present the Report

Summarize:
- Total due in next 30 days, split by autopay vs. manual payment needed
- Action required items (due soon, no autopay)
- Flagged anomalies with context
- Overdue items

Example: "3 bills need manual payment this week totaling $487. Electric bill is 35% higher than last month."

## 5. Deliver

Send via the user's preferred channel. If anything is overdue or due within 3 days without autopay, mark as high priority. On manual (non-Monday) runs, show only changes since the last report.

## Safety Rules

- **NEVER pay, authorize, or schedule any payment.** Read and report only.
- **NEVER store or log full account numbers.** Use last-four only.
- If autopay status is unclear from the email, assume it is NOT set and flag for manual attention.

## Notes

- PDF statement attachments may not be readable. Note when one is attached so the user can check manually.
- Over time, this workflow builds a baseline per biller, making anomaly detection more accurate.
