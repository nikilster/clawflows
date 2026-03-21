# Updates

## Thu, Mar 20

- 🐛 **Essentials Pack actually enables now** — The installer was checking `workflows/available/` instead of `workflows/available/community/`, so the 4 essentials never actually got enabled. The banana was in the wrong basket this whole time! 🍌
- ✨ **Try-it-now suggests morning inspiration** — Changed the post-install "Try It Now" suggestion from `check-calendar` to `send-morning-inspiration` — works without any services configured, so new users get instant gratification! 🍌
- 💬 **Friendlier enable messages** — `clawflows enable` now shows the emoji, description, and schedule instead of debug-style output. You'll know exactly what you just turned on and when it runs! 🍌
- 🖥️ **Dashboard in post-install** — The "Try It Now" section now suggests `clawflows dashboard` first so new users can browse everything visually.
- 📧 **New check-email workflow** — A read-only inbox summary that categorizes your emails and shows what matters — no sneaky unsubscribing or archiving behind your back! Think of it as a banana you can look at but not peel 🍌
- 🔄 **Safer essentials pack** — Swapped `process-email` for `check-email` in the Essentials Pack. New users get a gentle inbox overview instead of auto-unsubscribing from day one. You can always enable `process-email` later when you're ready to let the minion loose on your inbox!
- 🚀 **Post-install try-it-now** — After installing, you now get a friendly nudge to run your first workflow right away. One command, instant banana gratification 🍌

## Wed, Mar 19

- 🧹 **Removed `requires` field** — The `requires` frontmatter field never got used by a single workflow or the CLI, so we yeeted it. Workflows just describe what they need in plain text and the agent figures it out — no need for a formal dependency spec. One less thing to think about when creating a workflow, one more banana for simplicity! 🍌

## Sun, Mar 8

- 📜 **Run logs** — `clawflows run` now captures agent output automatically, so you can see exactly what happened! `clawflows logs` shows your recent runs with their output, filter by workflow name or date. The dashboard shows log previews in Run History and expandable logs in the detail panel. No more "did it run?" guessing — every banana leaves a trail now 🍌

## Fri, Mar 7

- 📤 **Share a single workflow** — `clawflows share <name>` generates shareable text with the workflow's emoji, name, description, and a one-liner install+enable command. Add `--copy` to yeet it straight to your clipboard. The dashboard detail panel also has a shiny Share button that renders a shareable image card, lets you download it, copy the text, or post on X. One banana at a time, shared with the world! 🍌

## Mon, Feb 24

- 📊 **Run history in the dashboard** — The dashboard now has a Run History tab showing when your workflows actually ran! See all runs grouped by date (newest first), click any to open the workflow detail panel, and each workflow's panel now shows its 5 most recent runs. It's like a banana-flavored activity feed for your workflows 🍌
- 🧠 **Agent knows create auto-enables** — The agent-facing instructions now explicitly say that `clawflows create` auto-enables the workflow and syncs AGENTS.md. No more "let me enable that for you" after creating — the banana was already in the basket! 🍌
- 🔔 **No more double reminders** — Scheduled workflows were firing twice because the scheduler saved run markers using the current time instead of the scheduled time. Two consecutive 15-min checks would both think the workflow hadn't run yet. Now the marker is always keyed to the scheduled time — one banana per time slot, no duplicates! 🍌

## Sun, Feb 22

- 🌐 **Live dashboard** — `clawflows dashboard` now starts a local server so you can enable and disable workflows right from your browser — no more copying CLI commands! Click the toggle, watch it flip, done. It's like having a banana-powered control panel 🍌
- ⚡ **9x faster dashboard** — Dashboard JSON generation went from 5.2s to 0.6s by replacing ~550 subprocess spawns with a single awk pass. Your banana-powered control panel now loads before you can peel one 🍌
- 🚀 **Instant enable/disable** — Toggling workflows and creating new ones now update the UI instantly with optimistic rendering. The server syncs in the background while you admire your freshly toggled banana.
- 🍌 **Custom vs Community in list** — `clawflows list` now separates your custom workflows from community ones! Your bananas go in one basket, the community's in another. No more guessing which workflows are yours.
- 🔗 **Fixed rogue workflow creation** — The creating-workflows guide was telling agents to drop workflows straight into `workflows/enabled/` like a banana without a peel. Now it correctly says to use `clawflows create`, which puts them in `custom/` and symlinks them like a civilized minion.

## Thu, Feb 19

- 🍌 **Generic nudge in create** — The interactive `clawflows create` prompt now gently reminds you to keep it generic — say "the user" not your name, skip the hardcoded locations. Your workflows should work for any banana-loving human, not just you!

## Wed, Feb 18

- 🧙 **Interactive workflow creation** — Agents now walk you through questions before creating a workflow, show you the result, and ask if you want tweaks — no more yolo JSON dumps! The creating-workflows guide is the single source of truth, and `_build_block()` tells the agent to read it first. One file to rule them all, one file to find them!

## Tue, Feb 17

- 📖 **Workflow creation guide link** — The agent now knows about `docs/creating-workflows.md` when creating clawflows — no more guessing, just follow the banana-scented blueprint!
- 🤖 **Agent-friendly installer** — Added clear explanations throughout `install.sh` so AI agents stop freaking out about cron jobs and PATH changes. Installer now detects no terminal (agent context) and skips interactive prompts — the agent handles backup restore and essentials conversationally instead of silently auto-accepting. Humans still get the same interactive experience!
- 🍌 **Generic workflows** — Workflows are now written so ANY human can use them — no more hardcoded names, cities, or banana preferences.
- 🧠 **Live updates** — After `clawflows update`, the agent re-reads AGENTS.md so it picks up new instructions mid-conversation.
- 🗣️ **New trigger phrases** — Say "make a clawflow", "let's make a workflow", whatever feels natural — your agent gets it now.
- ✍️ **Simple workflows** — New guidance to keep workflow descriptions short, clear, and jargon-free.
- 🚧 **Pre-launch notice** — README now warns accidental visitors to close their eyes and slowly walk away.
- 🔔 **GitHub alert** — Pre-launch notice upgraded to a colored GitHub alert callout for extra visibility.
- 🎨 **CLI emojis** — `clawflows help` now has emojis next to each command category.
- 📋 **Full changelog** — updates.md now covers every single commit in the project history.
- 🔀 **Split entries** — Multi-feature commits broken out into individual changelog entries.
- ➕ **Morning briefing** — Added morning-briefing workflow.
- ➖ **Morning briefing reverted** — Reverted the morning-briefing workflow.
- 📝 **Updates formatting** — Changelog entries grouped by day with bolded summaries and emojis.
- 📅 **Day names** — Changelog headings now show the day of the week (e.g., "Tue, Feb 17").

## Mon, Feb 16

- 🔍 **Custom workspace detection** — AGENTS.md sync now finds your workspace from `openclaw.json`, even if it's not the default path.
- 💾 **Backup on install** — Installer checks for existing backups and offers to restore your custom workflows and enabled list.
- 🐚 **Non-interactive shell fix** — `openclaw` is now found even when PATH is incomplete (like in cron jobs).
- 🚫 **No more auto-star** — Removed the auto-star prompt and clarified auto-updater messaging.
- 🗣️ **Dave's star message** — Dave the Happy Minion now asks in his own voice to star the repo.
- 🌐 **Dave's website** — Star message now links to davehappyminion.com.
- 🔗 **Clean URLs** — Cleaned up URLs in the star message.
- 🔒 **--no-updater flag** — You can opt out of auto-updates, but Dave strongly recommends against it.
- 🧪 **Openclaw tests** — Added tests for `_find_openclaw` and scheduler cron auto-setup.
- 📋 **Dev checklist** — Every change now requires agent instructions, tests, and a changelog entry.
- 🧪 **Workspace tests** — Added workspace detection tests for custom OpenClaw workspaces.
- 🍌 **Generic workflow guidance** — Added docs about keeping workflows shareable and user-agnostic.

## Sun, Feb 15

- 🧪 **Comprehensive test suite** — 132 BATS tests covering enable, disable, list, create, run, backup, restore, validate, submit, and more.

## Sat, Feb 14

- ✏️ **Edit command** — `clawflows edit` copies a community workflow to custom/ so you can modify it without losing changes on update.
- 📂 **Open command** — `clawflows open` opens any workflow in your editor.
- 💾 **Backup command** — `clawflows backup` saves your custom workflows and enabled list to a tar.gz.
- ♻️ **Restore command** — `clawflows restore` brings back your workflows from a backup.
- 📝 **CLAUDE.md** — Added project context doc so Claude Code understands the codebase.
- 🌍 **Community submissions** — `clawflows submit` packages your workflow for a PR to the community repo.
- 🔄 **Auto-updater workflow** — `update-clawflows` keeps your workflows fresh automatically, like Chrome updates.
- ✅ **Validate command** — `clawflows validate` checks that a workflow has all required fields before you share it.

## Fri, Feb 13

- ✨ **Create wizard** — `clawflows create` walks you through naming, emoji, schedule, and description step by step.
- 🤖 **JSON API** — Agents create workflows programmatically with `clawflows create --from-json`.
- 📂 **Community/custom split** — Workflows now live in `community/` (from the repo) and `custom/` (yours, gitignored). Custom overrides community by name.
- ⚠️ **Uninstall warning** — `clawflows uninstall` now warns you about custom workflow deletion before nuking the directory.
- 🐛 **Bash 3.2 compat** — Removed bash 4.x associative arrays so it works on stock macOS.
- 💡 **Wizard UX** — Create wizard now suggests verb-prefixed names and clarifies the author field.
- 📍 **File path after create** — After creating a workflow, shows the file path so you know where to edit it.
- 📋 **Run in help** — Added the run command to the help text.
- ▶️ **Run command** — `clawflows run` fires up your agent to execute a workflow right now.
- 📝 **Simpler agent instructions** — Simplified workflow creation instructions for agents.
- 🔌 **Openclaw syntax fix** — Fixed the openclaw agent command syntax.
- 📄 **Show instructions** — Show instructions instead of auto-running workflows.
- 🚀 **Openclaw agent integration** — Workflows run via `openclaw agent --local`.
- 🔧 **Optional fields fix** — Graceful handling of missing optional JSON fields and AGENTS.md.
- 🔧 **Agent flag fix** — Use `--agent main` for openclaw agent command.
- 💬 **Run hint after create** — Show how to run the workflow after creating it.
- 🍌 **Star prompt** — Dave the Happy Minion asks you to star the repo. He worked very hard.
- 💛 **Personal star prompt** — Added personal touch to the star prompt.

## Thu, Feb 12

- ⏪ **Essentials reverted** — Restored the 4 essential workflows to their original, simpler versions.
- 🤝 **Meeting prep** — New `prep-next-meeting` workflow for attendee research and talking points.

## Wed, Feb 11

- 🤖 **Agent install guide** — Full step-by-step guide so your agent can install ClawFlows for you.
- 📋 **Author field spec** — Added author field to the frontmatter specification.
- 👤 **Author on all workflows** — Added author credit to every existing workflow.
- 🎛️ **Agent-driven setup** — Agent can now drive the full setup flow, not just humans in a terminal.
- 🗑️ **Removed duplicate agents.md** — Removed duplicate setup/agents.md, using system/AGENT.md instead.
- 🔐 **Security fix** — Replaced curl|bash with explicit commands in agent install guide.
- 🎯 **Essentials to 4** — Simplified Essentials Pack to 4 core workflows.
- 📥 **Local install script** — Agent guide now uses local install script instead of raw commands.
- 📝 **README update** — Updated README.md.
- 📐 **README spacing** — Added extra linebreaks before ## headings in README.
- 📐 **HTML spacing** — Added `<br>` tags before ## headings for visible spacing on GitHub.
- 📝 **README update** — Updated README.md.
- 📝 **README update** — Updated README.md.
- 📖 **Detailed essentials** — Rewrote the 4 essentials to be comprehensive with clear steps.
- 📝 **README update** — Updated README.md.
- 📝 **README update** — Updated README.md.
- 🗺️ **Natural language mapping** — Agent guide now maps what users say to which workflow to run.
- 🔗 **AGENTS.md sync** — CLI commands and workflow list now auto-sync to AGENTS.md.
- 🎉 **Essentials on install** — Installer and agent onboarding now offer to enable the Essentials Pack.
- ✏️ **Install prompt phrasing** — Updated agent install prompt phrasing.
- 🔗 **AGENT.md URL fix** — Fixed AGENT.md URL to correct branch and path.
- 🔧 **Installer fixes** — TTY prompt for essentials, clearer wording, suppress sync noise, fix ASCII art.
- 🎨 **Text header** — Replaced ASCII art with clean text header.
- ⏪ **Text header reverted** — Reverted back to ASCII art header.
- 🎨 **ASCII art fix** — Fixed ASCII art to clearly spell ClawFlows.
- 🤖 **Agent onboarding fix** — Fixed agent onboarding to ask about essentials and explain interactive usage.

## Tue, Feb 10

- 🏗️ **Project restructure** — Available/enabled pattern with symlinks. Enable creates a symlink, disable removes it.
- 📝 **README tagline** — Enhanced README with project tagline and purpose.
- 🧪 **First test suite** — Initial test suite for the clawflows CLI.
- 🔧 **CLI** — Full CLI with list, enable, and disable commands.
- 📥 **Installer** — Install script sets up the symlink, scheduler, and directory structure.
- 🦞 **Header image** — Added the lobster minion header image to README. Bello!
- 🖼️ **Header title** — Updated header with title and line separator above image.
- ✏️ **Header casing fix** — Fixed casing and removed double line in header.
- 📝 **Header summary** — Added short summary below header image.
- ⭐ **Essentials Pack** — 13 core daily workflows for morning routines, email, calendar, and more.
- 🔓 **Essentials tool-agnostic** — Rewrote Essentials Pack workflows to work with any tool.
- 🔓 **All tool-agnostic** — Made remaining 20 workflows tool-agnostic too.
- 😎 **Emoji field** — Added emoji field to all 33 workflows.
- ✨ **Morning inspiration** — Renamed `send-morning-quote` to `send-morning-inspiration` and added emojis to README.
- 📰 **README rewrite** — Rewrote README for conversion: install-first, categorized catalog, no fluff.
- 📝 **Intro bullets** — Punched up intro with bulleted examples, moved daily rhythm above install.
- 📝 **Title update** — Updated the README title.
- ✂️ **Shorter intro** — Shortened the intro line.
- ✂️ **Removed filler** — Removed filler paragraph from intro.
- ✂️ **Removed timeline** — Removed ASCII timeline from README.
- ✂️ **Removed enable-all** — Removed enable-all block from daily rhythm section.
- ✂️ **Simpler install** — Simplified install section.
- 🗓️ **Scheduling** — Added schedule field to workflows, removed triggers.
- 🏗️ **Layout restructure** — Restructured project layout.
- 📝 **README paths** — Updated README paths for new structure.
- 📝 **Better intro bullets** — Punched up intro bullets.
- 🚫 **Config files removed** — Dropped config.env — agent uses skills for device context instead.
- 😎 **Emoji intro** — Added emojis and removed quotes from intro bullets.
- 📝 **Simpler docs** — Simplified scheduling, creating, and CLI sections for non-technical users.
- 🔗 **Repo URL fix** — Removed scripts, fixed repo URL to nikilster/clawflows.
- 📚 **Config & scripts docs** — Added optional config and scripts documentation.
- 📝 **Intro line update** — Updated intro line.
- 📝 **Intro emoji** — Updated intro line with emoji and examples lead-in.
- 📛 **Essentials rename** — Renamed Daily Rhythm to Essentials Pack.
- 🔼 **Get Started first** — Moved Get Started above Essentials Pack.
- ✂️ **Removed enable example** — Removed enable example from install block.
- ✂️ **Section rename** — Renamed Get Started, removed clawflows list line.
- 📝 **README update** — Updated README.md.
- 🏠 **OpenClaw workspace** — Changed install to use openclaw workspace directory.
- 📝 **README update** — Updated README.md.
- 📝 **README update** — Updated README.md.
- 📦 **20 more workflows** — Habits, meals, weather, journal, birthdays, subscriptions, packages, bills, deals, weekly update, PRs, deps, docker, logs, network, reading list, social posts, podcasts, photos, and interview prep.
- 📝 **README update** — Updated README.md.
- 📝 **README update** — Updated README.md.
- 🐛 **Stdin leak fix** — Fixed curl|bash stdin leak by redirecting /dev/null for openclaw cron commands.
- 📭 **Empty state message** — `clawflows list` now shows a helpful message when no workflows are found.
- 🔗 **Symlink fix** — Fixed symlink resolution so `clawflows list` works via `~/.local/bin` symlink.
- 🔄 **Update command** — `clawflows update` pulls the latest workflows from GitHub.
- 🔇 **Quieter installer** — Suppressed openclaw cron stdout/stderr noise.
- ⏭️ **Skip duplicate cron** — Scheduler setup now skips if the cron job already exists.
- 🎨 **Installer redesign** — ASCII art, colors, workflow count, and next steps in the installer output.
- 📋 **List emojis** — Show emojis in list, group by Enabled/Available headers.
- 🎯 **Emoji rendering fix** — Replaced Unicode escapes with actual emoji characters so they render properly.
- 📋 **List filtering** — Added list filtering (`list enabled`, `list available`).
- ❓ **Help command** — `clawflows help` shows all commands with descriptions and examples.
- 🗑️ **Uninstall command** — Clean removal of symlink, AGENTS.md block, and scheduler cron.
- 📚 **How to Use docs** — Added How to Use section and updated CLI commands documentation.

## Mon, Feb 9

- 🚀 **Initial commit** — ClawFlows is born! Reusable workflows for AI agents.
- 📝 **README capitalize** — Capitalized ClawFlows and added benefits section to README.
- 📝 **Config pattern** — Added config.env to separate personal values from workflow logic.
- 🔧 **Config optional** — Made config.env optional and simplified path resolution.
- ⏪ **Path revert** — Reverted path simplification, kept config.env optional.
- 📝 **Config docs** — Noted that config.env is optional in README.
- 🍌 **README vibes** — Made README funnier and more compelling. Dave approves.
- 📦 **20 workflows** — Focus mode, morning mode, away mode, plus process, check, build, send, and sync workflows.
