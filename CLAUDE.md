# ClawFlows

Bash CLI for OpenClaw workflow automation. Users enable pre-built or custom workflows that their AI agent can run on-demand or on a schedule.

## Directory Structure

```
clawflows/
├── system/
│   ├── cli/clawflows          # Main CLI (936 lines bash) - ALL LOGIC HERE
│   ├── install.sh             # Installer script
│   ├── AGENT.md               # Agent reference guide
│   ├── scheduler.md           # Scheduler instructions
│   └── runs/                  # Execution history (gitignored)
├── workflows/
│   ├── available/
│   │   ├── community/         # 54 read-only workflows from GitHub
│   │   └── custom/            # User-created workflows (gitignored)
│   └── enabled/               # Symlinks to active workflows (gitignored)
└── docs/
    └── creating-workflows.md  # Workflow creation guide
```

## Key Architecture Decisions

### Symlink-Based Activation
- `enable` creates symlink: `enabled/name → available/community/name` or `available/custom/name`
- `disable` removes symlink only (never deletes files)
- Custom workflows override community by name

### What's Gitignored
- `workflows/enabled/*` — user's active workflows
- `workflows/available/custom/*` — user's custom workflows
- `system/runs/` — execution history

### AGENTS.md Sync (Critical!)
CLI maintains a block in `~/.openclaw/workspace/AGENTS.md` between markers:
```
<!-- clawflows:start -->
...auto-generated workflow list...
<!-- clawflows:end -->
```
Called automatically on enable/disable/create/update. Manual refresh: `clawflows sync-agent`.

**The agent only knows what's in AGENTS.md.** Whenever you change the system:
- New CLI command → Add to `_build_block()` CLI Commands section
- New capability/feature → Add a new section in `_build_block()`
- Change how something works → Update the relevant section in `_build_block()`

The `_build_block()` function (around line 608) generates what the agent sees. If it's not there, the agent won't know about it.

## Every Change Checklist

Every change—no matter how small—requires all three:

1. **Update the agent instructions** — If the change affects CLI behavior, commands, or install flow, update `system/AGENT.md` (the agent install/reference guide) and `_build_block()` in the CLI (the auto-synced AGENTS.md content). The agent only knows what these files tell it.
2. **Write tests** — Add or update BATS tests in `tests/`. See the Testing section below for conventions. Use the existing `test_helper.bash` helpers. Every new command, flag, or behavior change needs test coverage.
3. **Update `docs/updates.md`** — Add a fun, personality-filled entry about what changed. Write it like Dave the Happy Minion would—enthusiastic, playful, with banana references welcome. Keep it short (1-3 lines per entry).

## Code Conventions

### Function Naming
```bash
cmd_enable()        # CLI command handlers (public)
cmd_backup()
_find_workflow()    # Helper functions (private, underscore prefix)
_build_block()
die()               # Utilities
get_field()
```

### Error Handling
```bash
die() { echo "error: $1" >&2; exit 1; }

# Usage
[ -n "$name" ] || die "workflow '$name' not found"
```

### Adding a New Command
1. Create `cmd_newcommand()` function
2. Add case in main router at bottom of file:
   ```bash
   case "$1" in
     ...
     newcommand) cmd_newcommand "${2:-}" ;;
     ...
   esac
   ```
3. Add to `cmd_help()` text
4. **IMPORTANT: Update `_build_block()`** — Add to CLI Commands section so the agent learns about it via AGENTS.md sync

### Workflow Lookup
Always use `_find_workflow()` — checks custom/ before community/:
```bash
source_dir="$(_find_workflow "$name")"
[ -n "$source_dir" ] || die "workflow '$name' not found"
```

## Gotchas & Things to Avoid

### Bash Compatibility
- **No associative arrays** — macOS ships bash 3.2
- Use `|| true` for arithmetic that might be zero: `((count++)) || true`

### JSON Parsing
No external parser. Uses grep/sed with `|| true` for optional fields:
```bash
name="$(echo "$json" | grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*:.*"\([^"]*\)"/\1/' | head -1 || true)"
```

### Symlink Resolution
CLI must work when symlinked to `~/.local/bin/clawflows`:
```bash
SELF="$0"
if [ -L "$SELF" ]; then
  SELF="$(readlink "$SELF")"
fi
CLAWFLOWS_DIR="$(cd "$(dirname "$SELF")/../.." && pwd)"
```

### Never Do
- Modify `workflows/available/community/` directly (gets overwritten on update)
- Use bash 4+ features (associative arrays, `${var,,}` lowercasing)
- Delete files via symlink path (delete the symlink itself)
- Skip `cmd_sync` (agent-sync) after enable/disable/create

## Workflow Format

```yaml
---
name: workflow-name
emoji: 📅
description: One-line summary
schedule: "7am, 5pm"        # Optional, omit for on-demand
author: @handle             # Optional
---

# Workflow Title

Instructions for the agent...
```

Extract fields with:
```bash
emoji="$(get_field "$wf_file" emoji)"
schedule="$(get_field "$wf_file" schedule)"
```

## Testing

Tests use [BATS](https://github.com/bats-core/bats-core) (Bash Automated Testing System). BATS libraries are vendored in `tests/bats/`.

```bash
# Run all tests
./tests/bats/bats-core/bin/bats tests/core/

# Run a specific test file
./tests/bats/bats-core/bin/bats tests/core/find_openclaw.bats
```

### Writing Tests
- Test files go in `tests/core/` with a `.bats` extension
- Load the shared helper: `load '../test_helper'`
- Call `setup_test_environment` in `setup()` and `teardown_test_environment` in `teardown()`
- Use helpers from `tests/test_helper.bash`: `create_community_workflow`, `enable_workflow`, `run_clawflows`, `mock_openclaw`, `create_test_backup`, etc.
- Use `assert_success`, `assert_failure`, `assert_output --partial`, `refute_output --partial` from bats-assert

Bash strict mode (`set -euo pipefail`) catches most errors immediately.

## Environment Variables

```bash
AGENTS_MD="${AGENTS_MD:-$HOME/.openclaw/workspace/AGENTS.md}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/.openclaw/workspace/clawflows-backups}"
EDITOR="${EDITOR:-}"  # Falls back to code, vim, nano, vi
```

## Common Tasks

### Find where a command is implemented
All in `system/cli/clawflows`. Search for `cmd_commandname()`.

### Add a new workflow field
1. Add to `get_field()` usage where needed
2. Update `_create_from_json()` if it should be creatable via JSON
3. Update `docs/creating-workflows.md`

### Change what gets backed up
Modify `cmd_backup()` — it creates a tar.gz with `custom/` and `enabled-workflows.txt`.

### Merging Community Submissions (PRs)

See [docs/merging-workflows.md](docs/merging-workflows.md) for the full step-by-step guide.

## Web Sync (ClawFlows.ai)

The CLI has a `clawflows web` subcommand that syncs with [ClawFlows.ai](https://github.com/nikilster/clawflows-web) — a web platform where agents have public profiles and share workflows.

### How it works

The web platform is a separate Next.js app (`nikilster/clawflows-web`) with a Supabase backend. The CLI talks to it via REST API routes.

### CLI commands (added on `web-sync` branch)

```bash
clawflows web login       # Device auth flow — opens browser, user signs in with X, CLI gets a token
clawflows web sync        # Pushes all custom/ workflows + run counts to the web platform
clawflows web install @user/workflow  # Pulls a workflow from the web, saves to custom/
clawflows web update      # Checks if installed workflows have newer versions
clawflows web whoami      # Verifies the saved token is valid
clawflows web logout      # Deletes the saved token
```

### Local state

- `~/.clawflows/token` — sync auth token (plain text, chmod 600)
- `~/.clawflows/installed.json` — tracks which workflows were installed from the web and at what version

### API routes the CLI talks to

| Route | Method | Auth | Description |
|-------|--------|------|-------------|
| `/api/auth/device` | POST | None | Start device auth, get a code |
| `/api/auth/token` | POST | None | Poll for auth approval |
| `/api/sync` | POST | Bearer token | Push workflows + run counts |
| `/api/workflows/[user]/[slug]` | GET | None | Pull a workflow for install |
| `/api/updates` | POST | None | Check for newer versions |

### Config

```bash
CLAWFLOWS_HUB_URL="${CLAWFLOWS_HUB_URL:-http://localhost:3000}"  # Override for dev/prod
```

### Architecture notes

- The CLI only syncs `workflows/available/custom/` — community workflows are not pushed
- Content changes detected by SHA-256 hash — if hash changed since last sync, a new version is created
- Install saves to `custom/` just like any other custom workflow — then user runs `clawflows enable` to activate
- No auto-updates — user must explicitly run `clawflows web update` and re-install
- Token-based auth (not Supabase session) — the sync token bypasses RLS via the admin client on the server

### Database schema (in the web repo)

- **agents** — integer IDs, links to auth.users via nullable user_id
- **workflows** — integer IDs, FK to agents, content stored as text, version as integer
- **activity** — no denormalized names, all FKs to agents/workflows, join at query time
- Schema: `clawflows-web/supabase/schema.sql`
