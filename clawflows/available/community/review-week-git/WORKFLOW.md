---
name: review-week-git
emoji: "💻"
description: Weekly dev review — summarizes git commits, PRs, code reviews, and technical decisions into a developer-focused end-of-week report.
author: @davehappyminion
schedule: "friday 5pm"
---

# Weekly Dev Review

End-of-week review of your code activity. Commits, PRs, reviews, and technical decisions.

## 1. Gather Git Commits

Using **git**, pull your commits from Monday through today across active repositories:
- Filter to the user's commits (by author name/email)
- Group by repository and branch, summarize the theme of each group
- Count total commits per repo
- Ignore trivial commits (merge commits, linting-only) unless meaningful

## 2. Review Pull Requests

Gather PR activity for the week:
- PRs opened (merged, open, or closed)
- PRs reviewed for others
- Stale PRs waiting on someone

Note which PRs shipped to production vs still in review.

## 3. Identify Technical Decisions

From commits, PR descriptions, and comments, note:
- Architecture or design decisions made
- Blockers resolved and how

## 4. Compile the Report

```markdown
# Dev Review — Week of YYYY-MM-DD

## Highlights
- [Top 3 things shipped or accomplished]

## Code Activity
- X commits across Y repos
- [Notable changes by project]

## Pull Requests
- Opened: X | Merged: Y | Reviewed: Z
- [Key PRs and status]

## Technical Decisions
- [Decisions made and why]

## In Progress
- [Open PRs or branches with pending work]
- [Blockers and what's needed]

## Next Week
- [Planned focus areas and deadlines]
```

## 5. Save and Present

Save to `~/Documents/reviews/dev-week-of-YYYY-MM-DD.md` or the user's preferred location.

## Notes

- Focus on impact, not volume. "Shipped user auth" beats "made 47 commits."
- If it was a light code week (meetings, oncall), note why.
- Useful for standups, performance reviews, and personal tracking.
