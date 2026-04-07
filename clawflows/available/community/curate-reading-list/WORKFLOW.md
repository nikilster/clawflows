---
name: curate-reading-list
emoji: "📚"
description: Scan Hacker News, Reddit, RSS feeds, and newsletters for articles matching your interests. Deduplicate, rank, and deliver a clean reading list every morning.
author: @davehappyminion
schedule: "8am"
---

# Curate Reading List

Gather the best articles from across the web, filter out noise, and deliver a focused reading list.

## 1. Load User Interests

Check the user's config or memory for topic preferences (e.g., "AI/ML", "systems programming", "startup strategy"), blocked domains, and past reading lists. If no interests are set, ask for 3-5 topics before proceeding.

## 2. Gather Sources

Pull recent content from:
- **Hacker News** — Top 30 stories and Show HN posts
- **Reddit** — Top posts from subreddits matching user interests
- **RSS feeds** — If configured, fetch latest entries
- **Newsletters** — Check for forwarded newsletter content in inbox or saved directory

Capture: title, URL, source, brief description, and approximate reading time.

## 3. Filter and Deduplicate

- Remove articles the user has already seen (check previous lists)
- Deduplicate by URL and content similarity (same story from multiple sources — keep the best version)
- Filter out paywalled content unless the user has a subscription
- Remove clickbait and low-substance content

## 4. Rank and Select

Rank by relevance to stated interests, source quality, and freshness. Select the top 5-10 articles.

## 5. Present Reading List

For each selected article, provide:
- Title, source, estimated reading time
- 2-3 sentence summary of the key takeaway
- Why it was selected (which interest it matches)

Include a few honorable mentions that did not make the top picks.

## 6. Save and Archive

- Save the reading list to the user's configured output location
- Update the "already seen" list to avoid future duplicates
- Offer to send articles to a read-later service (Pocket, Instapaper) if configured

## Notes

- Runs daily at 8am but can also be triggered on-demand.
- Never auto-subscribe the user to anything. Read-only gathering.
- If a source is unreachable, skip it and note the failure.
- Five great articles beat ten mediocre ones. Quality over quantity.
