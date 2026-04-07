---
name: clear-open-tabs
emoji: "🧹"
description: Browser tab cleanup — lists open tabs, bookmarks the keepers, closes the stale ones, fresh start
author: @davehappyminion
---

# Clear Your Open Tabs

A quick cleanup session for your browser tabs. Sort through what's open, save anything worth keeping, and close the rest.

## Steps

1. **List open tabs** — Use your **browser skill** to get a list of all currently open tabs across browser windows. Show the tab title and URL for each.

2. **Categorize tabs** — Group them into buckets:
   - **Active** — Things you're currently working on
   - **Reference** — Articles, docs, or resources you might need later
   - **Stale** — Tabs open for days that you've forgotten about
   - **Entertainment** — Social media, videos, shopping

3. **Ask about keepers** — Walk through the list with the user. For each group, ask what they want to keep, bookmark, or close.

4. **Bookmark the keepers** — For tabs the user wants to save but doesn't need open, offer to bookmark them in a folder (like "Saved from Tab Cleanup — [date]").

5. **Close the rest** — With the user's go-ahead, close the stale and finished tabs. Aim for 5 or fewer tabs remaining.

## Output Format

```
Tab Cleanup — [date]

You have 23 tabs open across 2 windows.

Active (keep open):
  - Project dashboard
  - Google Docs — Q1 report

Reference (bookmark these?):
  - "How to Set Up CI/CD" — Medium article
  - React documentation
  - Recipe: Thai basil chicken

Stale (probably safe to close):
  - Amazon search from last Tuesday
  - Weather forecast (3 days old)
  - 6 Google search result tabs

Close 17 tabs, bookmark 3, keep 3 open?
```

## Notes

- Always confirm before closing tabs. Nobody wants to lose something important.
- If the user has a huge number of tabs (50+), don't list every single one. Summarize and focus on categories.
- No judgment about how many tabs someone has. Tab hoarding is universal.
- If the browser skill isn't available, walk the user through the cleanup manually.
