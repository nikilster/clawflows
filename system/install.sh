#!/usr/bin/env bash
set -euo pipefail

# ── ClawFlows Installer ─────────────────────────────────────────────────────
#
# ClawFlows gives your OpenClaw agent superpowers — 50+ pre-built workflows
# for email triage, morning briefings, smart home control, meeting prep,
# and more. Enable a workflow and your agent just knows how to do it.
#
# This installer is safe and standard. Everything stays local:
#
#   1. Clones the ClawFlows repo to the OpenClaw workspace (or pulls latest)
#   2. Symlinks the CLI to ~/.local/bin/clawflows
#   3. Adds ~/.local/bin to PATH if not already there
#   4. Sets up the workflow scheduler via OpenClaw cron (checks every 15 min
#      for due workflows — this is how scheduled workflows like morning
#      briefings run automatically)
#   5. Restores from backup if a previous install exists
#   6. Enables the Essentials Pack (4 starter workflows) if no backup restored
#   7. Enables auto-updates to keep community workflows current (like a
#      package manager — pulls latest via git)
#   8. Syncs AGENTS.md so the agent knows about available workflows
#
# Nothing is installed outside ~/.local/bin and the OpenClaw workspace.
# Uninstall everything cleanly anytime: clawflows uninstall
#
# Works two ways:
#   1. curl -fsSL <url>/install.sh | bash  (clones the repo)
#   2. bash install.sh  (already cloned)
#
# After install, the agent's AGENTS.md is updated with everything it needs:
# CLI commands, enabled workflows, how to create/share/run workflows.
# The agent should re-read AGENTS.md after install to pick up the new info.

REPO_URL="https://github.com/davehappyminion/clawflows.git"
BIN_DIR="$HOME/.local/bin"
BIN_TARGET="$BIN_DIR/clawflows"

# Detect OpenClaw workspace (supports custom workspace directories)
_oc_workspace=""
if [ -f "$HOME/.openclaw/openclaw.json" ]; then
  _oc_workspace="$(grep -o '"workspace"[[:space:]]*:[[:space:]]*"[^"]*"' "$HOME/.openclaw/openclaw.json" | sed 's/.*:.*"\([^"]*\)"/\1/' | head -1 || true)"
fi
_oc_workspace="${_oc_workspace:-$HOME/.openclaw/workspace}"

INSTALL_DIR="$_oc_workspace/clawflows"

# ── Flags ─────────────────────────────────────────────────────────────────
NO_UPDATER=false
for arg in "$@"; do
  case "$arg" in
    --no-updater) NO_UPDATER=true ;;
  esac
done

# ── Colors ─────────────────────────────────────────────────────────────────
BOLD='\033[1m'
DIM='\033[2m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

info()  { printf "  ${BLUE}→${RESET} %s\n" "$1"; }
ok()    { printf "  ${GREEN}✓${RESET} %s\n" "$1"; }
warn()  { printf "  ${YELLOW}!${RESET} %s\n" "$1"; }
err()   { printf "  ${RED}✗${RESET} %s\n" "$1" >&2; exit 1; }

# ── Header ─────────────────────────────────────────────────────────────────

printf "${CYAN}"
cat << 'LOGO'

  ____ _                 _____ _
 / ___| | __ ___      __| ___| | _____      _____
| |   | |/ _` \ \ /\ / /| |_  | |/ _ \ \ /\ / / __|
| |___| | (_| |\ V  V / |  _| | | (_) \ V  V /\__ \
 \____|_|\__,_| \_/\_/  |_|   |_|\___/ \_/\_/ |___/

LOGO
printf "${RESET}"
printf "  ${BOLD}⚡️ Superpowers for your OpenClaw agent${RESET}\n"
printf "  ${DIM}github.com/davehappyminion/clawflows${RESET}\n"
echo ""

# ── 1. Clone or update ──────────────────────────────────────────────────────

command -v git >/dev/null 2>&1 || err "git is required but not installed"

if [ -d "$INSTALL_DIR/.git" ]; then
  info "Pulling latest workflows..."
  git -C "$INSTALL_DIR" pull --ff-only --quiet 2>/dev/null || warn "Could not pull latest (offline or diverged)"
  ok "Updated"
else
  if [ -d "$INSTALL_DIR" ]; then
    err "$INSTALL_DIR already exists but is not a git repo. Remove it first."
  fi
  info "Downloading workflows..."
  git clone --quiet "$REPO_URL" "$INSTALL_DIR"
  ok "Cloned to $INSTALL_DIR"
fi

# ── 2. Create directories ───────────────────────────────────────────────────

mkdir -p "$INSTALL_DIR/workflows/enabled"
mkdir -p "$INSTALL_DIR/system/runs"

# ── 3. Symlink the CLI ──────────────────────────────────────────────────────

mkdir -p "$BIN_DIR"

if [ -L "$BIN_TARGET" ] || [ -e "$BIN_TARGET" ]; then
  rm -f "$BIN_TARGET"
fi

ln -s "$INSTALL_DIR/system/cli/clawflows" "$BIN_TARGET"
ok "Installed clawflows CLI"

# ── 4. Ensure ~/.local/bin is in PATH ────────────────────────────────────────
# Standard PATH setup — makes the clawflows CLI accessible from any terminal

path_ok=false
case ":${PATH}:" in
  *":$BIN_DIR:"*) path_ok=true ;;
esac

if ! $path_ok; then
  rc_file=""
  case "${SHELL:-}" in
    */zsh)  rc_file="$HOME/.zshrc" ;;
    */bash) rc_file="$HOME/.bashrc" ;;
  esac

  if [ -n "$rc_file" ]; then
    if ! grep -qF "$BIN_DIR" "$rc_file" 2>/dev/null; then
      printf '\n# Added by ClawFlows installer\nexport PATH="%s:$PATH"\n' "$BIN_DIR" >> "$rc_file"
      ok "Added to PATH in $rc_file"
      warn "Open a new terminal or run: source $rc_file"
    else
      ok "PATH already configured"
    fi
  else
    warn "Add $BIN_DIR to your PATH manually"
  fi
else
  ok "PATH already configured"
fi

# ── 5. Set up scheduler cron ─────────────────────────────────────────────────
# This is how scheduled workflows (like morning briefings) run automatically.
# It adds an OpenClaw cron job that checks every 15 minutes for due workflows.

# Find openclaw — command -v may fail if ~/.local/bin isn't in this shell's PATH yet
OPENCLAW=""
if command -v openclaw >/dev/null 2>&1; then
  OPENCLAW="openclaw"
else
  for try_path in "$BIN_DIR/openclaw" "/usr/local/bin/openclaw" "/opt/homebrew/bin/openclaw"; do
    if [ -x "$try_path" ]; then
      OPENCLAW="$try_path"
      break
    fi
  done
fi

if [ -n "$OPENCLAW" ]; then
  if "$OPENCLAW" cron list </dev/null 2>/dev/null | grep -q "clawflows-scheduler"; then
    ok "Scheduler already running"
  else
    info "Setting up auto-scheduler..."
    "$OPENCLAW" cron add \
      --name "clawflows-scheduler" \
      --cron "*/15 * * * *" \
      --session isolated \
      --message "Read and execute $INSTALL_DIR/system/scheduler.md" \
      --no-deliver </dev/null >/dev/null 2>&1
    ok "Scheduler running (checks every 15 min)"
  fi
else
  warn "openclaw not found — skipping scheduler"
fi

# ── 6. Restore from backup ──────────────────────────────────────────────────
# If the user had a previous install, restore their custom workflows and
# enabled list automatically. This preserves their setup across reinstalls.

BACKUP_DIR="${BACKUP_DIR:-$_oc_workspace/clawflows-backups}"
RESTORED_BACKUP=false

if [ -d "$BACKUP_DIR" ] && ls "$BACKUP_DIR"/*.tar.gz >/dev/null 2>&1; then
  backup_count=$(ls -1 "$BACKUP_DIR"/*.tar.gz 2>/dev/null | wc -l | tr -d ' ')
  latest_backup=$(ls -r "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -1)
  latest_name=$(basename "$latest_backup")

  if [ -t 1 ]; then
    # Terminal: ask the user
    echo ""
    printf "  ${BOLD}Existing Backup Found${RESET}\n"
    echo ""
    if [ "$backup_count" -eq 1 ]; then
      printf "  Found 1 backup: ${CYAN}%s${RESET}\n" "$latest_name"
    else
      printf "  Found %s backups — latest: ${CYAN}%s${RESET}\n" "$backup_count" "$latest_name"
    fi
    echo ""
    printf "  Restore your custom workflows and enabled list? [Y/n] "
    read -r restore_confirm </dev/tty 2>/dev/null || restore_confirm="y"

    if [ "$restore_confirm" != "n" ] && [ "$restore_confirm" != "N" ]; then
      "$BIN_TARGET" restore latest 2>/dev/null || true
      RESTORED_BACKUP=true
      ok "Backup restored"
    else
      info "Skipped — restore anytime with: clawflows restore"
    fi
  else
    # No terminal (agent context): auto-restore
    "$BIN_TARGET" restore latest 2>/dev/null || true
    RESTORED_BACKUP=true
    ok "Backup restored (found previous install)"
  fi
fi

# ── 7. Enable essentials ────────────────────────────────────────────────────
# If no backup was restored, enable the 4 starter workflows so the user has
# something useful right away. They can disable any of them anytime with:
# clawflows disable <name>

ESSENTIALS=(send-morning-inspiration send-morning-briefing process-email check-calendar)

if ! $RESTORED_BACKUP && [ -t 1 ]; then
  echo ""
  printf "  ${BOLD}The Essentials Pack${RESET}\n"
  echo ""
  printf "  We strongly recommend enabling these 4 workflows to start:\n"
  echo ""
  printf "    ✨ ${BOLD}send-morning-inspiration${RESET}   Uplifting quote to start your day\n"
  printf "    ☀️  ${BOLD}send-morning-briefing${RESET}     Weather, calendar, priorities at 7am\n"
  printf "    📧 ${BOLD}process-email${RESET}              Inbox triage — unsubscribe junk, surface important\n"
  printf "    📅 ${BOLD}check-calendar${RESET}             48-hour radar with conflict detection\n"
  echo ""
  printf "  ${DIM}You can disable any of these anytime with: clawflows disable <name>${RESET}\n"
  echo ""
  printf "  Enable the essentials? [Y/n] "
  read -r essentials_confirm </dev/tty 2>/dev/null || essentials_confirm="y"

  if [ "$essentials_confirm" != "n" ] && [ "$essentials_confirm" != "N" ]; then
    for wf in "${ESSENTIALS[@]}"; do
      if [ -d "$INSTALL_DIR/workflows/available/$wf" ]; then
        "$BIN_TARGET" enable "$wf" >/dev/null 2>/dev/null
      fi
    done
    ok "Essentials enabled"
  else
    info "Skipped — you can enable them later with clawflows enable <name>"
  fi
fi

# ── 8. Auto-enable update-clawflows ─────────────────────────────────────────
# Keeps community workflows current by pulling latest via git, like a package
# manager. Users can disable anytime with: clawflows disable update-clawflows

if ! $NO_UPDATER; then
  "$INSTALL_DIR/system/cli/clawflows" enable update-clawflows >/dev/null 2>&1 || true
  ok "Auto-updater enabled (keeps workflows fresh — disable anytime with: clawflows disable update-clawflows)"
else
  info "Auto-updater skipped (--no-updater flag)"
fi

# ── 9. Sync AGENTS.md ───────────────────────────────────────────────────────
# This writes the ClawFlows reference block into AGENTS.md so the agent knows
# about all CLI commands, enabled workflows, how to create/share/run workflows.
# After this, the agent should re-read AGENTS.md to pick up the new info.

AGENTS_MD="${AGENTS_MD:-$_oc_workspace/AGENTS.md}"

if [ -f "$AGENTS_MD" ]; then
  "$BIN_TARGET" sync >/dev/null 2>&1
  ok "Agent synced — AGENTS.md updated with ClawFlows commands and workflows"
else
  info "No AGENTS.md found — skipping sync"
fi

# ── 10. Count workflows ─────────────────────────────────────────────────────

workflow_count=0
if [ -d "$INSTALL_DIR/workflows/available" ]; then
  workflow_count=$(ls -d "$INSTALL_DIR/workflows/available"/*/ 2>/dev/null | wc -l | tr -d ' ')
fi

# ── Star prompt ──────────────────────────────────────────────────────────────

echo ""
printf "  ${YELLOW}⭐ If you're enjoying ClawFlows, a star would absolutely make my day!${RESET}\n"
printf "  ${DIM}Dave Happy Minion worked really hard on this — it would mean a lot to him 🍌${RESET}\n"
printf "  ${DIM}Plus, you'll get notified when new workflows drop!${RESET}\n"
printf "    ${CYAN}https://github.com/davehappyminion/clawflows${RESET}\n"
echo ""

# ── Done ─────────────────────────────────────────────────────────────────────

echo ""
printf "  ${GREEN}${BOLD}Done!${RESET} ${BOLD}$workflow_count workflows${RESET} available.\n"
echo ""
printf "  ${BOLD}Next steps:${RESET}\n"
echo ""
printf "    ${CYAN}clawflows list${RESET}                     Browse all workflows\n"
printf "    ${CYAN}clawflows enable ${DIM}<name>${RESET}          Turn one on\n"
printf "    ${CYAN}clawflows update${RESET}                   Pull latest workflows\n"
echo ""

# If running without a terminal (agent context), print a note for the agent
if ! [ -t 1 ]; then
  echo "NOTE FOR AGENT: ClawFlows is installed. Your AGENTS.md has been updated"
  echo "with all ClawFlows commands and enabled workflows. Re-read your AGENTS.md"
  echo "now to see what's available. The user can say things like 'check my email',"
  echo "'run my morning briefing', or 'what workflows do I have?' and you'll find"
  echo "the matching workflow in AGENTS.md to run."
fi
