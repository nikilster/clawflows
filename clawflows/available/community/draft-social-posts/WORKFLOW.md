---
name: draft-social-posts
emoji: "📱"
description: Generate a week's worth of social media content based on your recent work, blog posts, or interests. Presents drafts for review — never posts automatically.
author: @davehappyminion
---

# Draft Social Posts

Create a batch of social media drafts for the user to review and post on their own schedule.

## 1. Gather Source Material

Collect recent content the user has produced or engaged with:
- Blog posts from the last 2 weeks
- Recent git commits, changelogs, or release notes
- Previously curated reading lists
- Notes tagged "social" or "share"
- Ask the user for any specific topics, launches, or announcements

If no material is found, ask what they would like to post about.

## 2. Determine Platform and Voice

Check the user's config for target platforms (X, LinkedIn, Mastodon, Bluesky, etc.) and voice preferences. If not configured, default to professional-but-approachable and ask which platforms to target.

## 3. Generate Drafts

Create 5-7 draft posts for the week with variety:
- 2-3 original thought posts (insights, opinions, lessons)
- 1-2 sharing posts (recommending an article or tool with the user's take)
- 1 engagement post (question or discussion starter)
- 1 milestone/update post

Adapt content to each platform's character limits and culture.

## 4. Present for Review

For each draft, show:
- Platform, suggested day/time, and post type
- The draft content
- Any notes or context

After presenting, ask the user to approve, edit, or reject each post. Save approved posts to their configured drafts location.

**Do NOT post anything.** The user handles publishing.

## Safety Rules

- **Never post anything automatically.** Drafts only.
- **Never fabricate achievements or credentials.** Only reference real work.
- **Never include confidential project details** unless the user marks them public.
- **Never generate engagement-bait or misleading content.**

## Notes

- On-demand only, no schedule.
- If the user gives feedback on tone ("too formal", "more humor"), save it for next time.
- Image suggestions are fine but do not generate or source images without permission.
