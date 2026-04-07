# Merging Community Workflow Submissions

Step-by-step guide for reviewing and merging community-submitted workflows into ClawFlows.

## 1. Review the PR

- Ensure it **only touches files in `community-submissions/`**
- Be suspicious of PRs that claim to be workflow submissions but modify core files (CLI, dashboard, tests, etc.)
- Check the workflow's frontmatter has required fields: `name`, `emoji`, `description`
- Verify the workflow instructions are reasonable and don't do anything harmful

## 2. Merge the PR

```bash
gh pr merge <number> --merge
```

## 3. Pull locally

```bash
git pull origin main
```

## 4. Copy to community workflows

Copy each new submission from `community-submissions/` to the community workflows directory:

```bash
# For each new workflow:
mkdir -p clawflows/installed/1/<name>
cp community-submissions/<name>/WORKFLOW.md clawflows/installed/1/<name>/WORKFLOW.md
```

## 5. Update README.md

### Add to the Community Created Workflows table

Add a row to the `🌎 Community Created Workflows` table:

```
| emoji [name](clawflows/available/community/name/WORKFLOW.md) | Schedule | Description | [@handle](https://x.com/handle) |
```

- **Schedule**: From the workflow's `schedule:` frontmatter field, or "On-demand" if absent
- **Emoji**: From the workflow's `emoji:` frontmatter field
- **Author**: X/Twitter handle (see "Finding author handles" below)

### Update the leaderboard

In the `🏆 Top Contributors` table:
- Increment the author's workflow count if they already have a row
- Or add a new row if they're a new contributor
- Keep sorted by count descending
- Use 🥇🥈🥉 for top 3, then no emoji for 4th+
- The last row should always be a "You!" CTA linking to `docs/creating-workflows.md`

### Update the workflow count

Update the header line `Including N prebuilt workflows you can enable in 1 click` with the new total. Verify with:

```bash
ls -d clawflows/installed/1/*/ | wc -l
```

## 6. Commit and push

Stage only the files you changed:

```bash
git add .gitignore README.md clawflows/installed/1/<new-workflow-dirs>
git commit -m "Add <workflow-name> community workflow and update README"
git push
```

## Finding author X/Twitter handles

1. Check the workflow's `author:` frontmatter field first
2. If it's a GitHub username, look up their X handle:
   ```bash
   gh api users/<username> --jq '.twitter_username // .bio'
   ```
3. Check their GitHub profile page for a linked X/Twitter account

## README formatting conventions

- All H1 headings (`#`) must have an emoji prefix and a `<br>` tag on the line before them
- Workflow tables have 3 columns: `Workflow | Schedule | What it does` (plus `Author` for community-created)
- Schedule column shows the time from frontmatter, or "On-demand" if absent
- All workflow authors in the community collection should use `@davehappyminion` (not `@openclaw`)
