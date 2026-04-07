---
name: learn-writing-style
emoji: "✍️"
description: Analyze the user's writing across email, social media, and blog posts to build a personalized writing style guide.
author: nikilster @nikil
---

# Learn Writing Style

Analyze how the user writes and create a writing style guide the agent references before drafting any content on their behalf.

## 1. Explain the Process

Start by telling the user how this works:

> "Here's what I'm going to do: I'll read through your writing across different sources — emails, social media, blog posts, messages, whatever you have. Then I'll create a writing style guide with a section for each source (how you write emails vs tweets vs blog posts — they're usually different). Plus a general section that captures your overall voice.
>
> After that, whenever you ask me to write something, I'll check the guide and pick the section closest to what I'm writing. If there's no exact match, I'll use the general section as a base.
>
> Let me check what sources I can access..."

## 2. Discover Available Sources

First, figure out what writing sources you already have access to. Check for:

- **Email** — try listing email accounts. Can you access sent mail?
- **Social media** — can you access X/Twitter, LinkedIn, Facebook posts?
- **Blog / website** — does the user have a personal site? Check USER.md or ask.
- **Messages** — do you have access to iMessage, Telegram, Slack, Discord, WhatsApp history?
- **Documents** — Notion, Google Docs, notes apps?

Use whatever discovery tools you have (CLI tools, browser, APIs) to check what's available. Don't guess — actually try.

## 3. Confirm with the User

Tell the user what sources you found access to:

> "I can pull your writing from: [list what you found]. Want me to analyze all of these? Any other sources you'd like to add?"

**If the user wants to add a source you don't have access to:**
- Help them set it up (install a CLI tool, log in via browser, connect an API, etc.)
- Walk them through it step by step
- Once connected, verify you can pull their writing before moving on

**The more sources, the better the guide.** But even just sent emails alone is enough to start.

## 4. Gather Writing Samples

For each confirmed source, pull as much writing as possible:

- **Sent emails** — pull 1,000+ sent emails, excluding unsubscribes and auto-replies. Extract just the user's text — strip quoted replies, signatures, and forwarded content.
- **Social media posts** — get original posts only. Filter out retweets/reposts and replies.
- **Blog posts or articles** — read all posts on their site.
- **Messages** — pull sent messages, focusing on longer/substantive ones.
- **Documents** — read what's available.

**Important:** Bias toward recent content — the user's voice evolves over time.

## 5. Analyze Patterns

For each content type, analyze:

- **Length** — how long are their messages? median word count, percentage short vs long
- **Openings** — how do they start? (no greeting? "Hey"? "Hi"? formal?)
- **Closings** — how do they sign off?
- **Tone** — casual or formal? enthusiastic or reserved? warm or businesslike?
- **Punctuation** — exclamation marks, dashes, emoji, ellipsis
- **Vocabulary** — common phrases, abbreviations, intensifiers, filler words they avoid
- **Formatting** — bullet points, line breaks, capitalization style
- **What they never do** — patterns they consistently avoid

For long-form content, also analyze:
- **Structure** — how do they organize ideas?
- **Storytelling** — do they use personal anecdotes? specific details?
- **Persuasion** — do they argue with data, experience, authority, or emotion?

## 6. Write the Style Guide

Create `writing-style-guide.md` in the workspace with these sections:

### General
Universal patterns that show up across ALL the user's writing — their core voice. This is the fallback section for any content type not explicitly covered below. Include:
- Core voice description (3-5 bullets)
- Language patterns (contractions, abbreviations, intensifiers)
- Punctuation habits
- What they never do
- How they talk about other people

### One Section Per Content Type
For each source analyzed (e.g., Email, Social Media, Blog Posts), create a dedicated section. Each should include:
- Key stats and patterns specific to that format
- How it differs from their general voice
- Example snippets showing the voice (anonymized — strip names and sensitive details)
- **Rules for drafting** — a numbered list of concrete rules to follow when writing this type of content

## 7. Wire It Up

Make sure the agent reads the guide before writing anything on behalf of the user.

**Add to USER.md** (so the agent knows the guide exists):

```markdown
## Writing Style
- See `writing-style-guide.md` for how [User] writes
- Always reference this before drafting any content on their behalf
```

**Add to AGENTS.md** (so the agent knows to read it before writing):

```markdown
## ✍️ Writing as [User]
Before writing ANY content on behalf of [User] (emails, tweets, blog posts, messages, drafts — anything), read `writing-style-guide.md` first. Match the content type to the closest section in the guide:
- **Email reply** → General + Email section
- **Tweet or thread** → General + X/Twitter section
- **Blog post or long-form** → General + Blog Posts section
- **Something else** → General section as the base + closest match
```

The key idea: **always use General as the base, then layer on the section closest to what you're writing.** If there's no exact match (e.g., writing a LinkedIn post but you only have an X/Twitter section), use General + the closest format.

## 8. Summarize

Tell the user:
- How many sources you analyzed (X emails, Y posts, Z articles)
- The most interesting patterns you found
- Where the guide is saved
- Ask if anything feels off or needs correction

## Notes

- Run this once to build the initial guide
- Update the guide whenever the user corrects a draft — log what was wrong and refine the rules
- The guide should contain patterns and rules, not raw text (privacy)
- Different platforms often have different voices — capture that
- The user's voice from 5 years ago may not match today — weight recent content higher
