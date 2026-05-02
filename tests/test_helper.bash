#!/usr/bin/env bash
# Test helper for clawflows BATS tests
# Provides test isolation, fixtures, and helper functions

# Load BATS support libraries
TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
load "${TESTS_DIR}/bats/bats-support/load"
load "${TESTS_DIR}/bats/bats-assert/load"

# Path to the real CLI (for reference, not used directly in isolated tests)
REAL_CLI="${TESTS_DIR}/../system/cli/clawflows"

# ============================================================================
# Test Environment Setup
# ============================================================================

# setup_test_environment creates an isolated test environment
# Call this in setup() for each test file
setup_test_environment() {
    # Create isolated temp directory for this test
    export TEST_TMPDIR="${BATS_TEST_TMPDIR:-$(mktemp -d)}"

    # Override all clawflows paths to use temp directory
    export CLAWFLOWS_DIR="${TEST_TMPDIR}/clawflows"
    export AGENTS_MD="${TEST_TMPDIR}/AGENTS.md"
    export BACKUP_DIR="${TEST_TMPDIR}/backups"

    # These would normally be set by the CLI, but we set them for testing
    export CREATED_DIR="${CLAWFLOWS_DIR}/clawflows/created"
    export COMMUNITY_DIR="${CLAWFLOWS_DIR}/clawflows/community"
    export CLAWFLOWS_JSON="${CLAWFLOWS_DIR}/clawflows/registry.json"

    # Create directory structure
    mkdir -p "$CREATED_DIR"
    mkdir -p "$COMMUNITY_DIR"
    mkdir -p "$BACKUP_DIR"
    mkdir -p "${CLAWFLOWS_DIR}/system/cli"
    mkdir -p "${CLAWFLOWS_DIR}/community-submissions"

    # Initialize empty registry.json
    echo '[]' > "$CLAWFLOWS_JSON"

    # Create a modified CLI that uses our test paths
    create_test_cli

    # Create empty AGENTS.md
    touch "$AGENTS_MD"
}

# teardown_test_environment cleans up after tests
# Call this in teardown() for each test file
teardown_test_environment() {
    # BATS_TEST_TMPDIR is auto-cleaned by BATS
    # Only clean up if we created our own tmpdir
    if [[ -z "${BATS_TEST_TMPDIR:-}" && -n "${TEST_TMPDIR:-}" ]]; then
        rm -rf "$TEST_TMPDIR"
    fi
}

# create_test_cli creates a CLI wrapper that uses test paths
create_test_cli() {
    export TEST_CLI="${CLAWFLOWS_DIR}/system/cli/clawflows"

    # Create a wrapper script that sets our test paths then sources the real CLI
    cat > "$TEST_CLI" << EOF
#!/usr/bin/env bash
set -uo pipefail

# TEST OVERRIDES - injected by test_helper.bash
CLAWFLOWS_DIR="${CLAWFLOWS_DIR}"
AGENTS_MD="${AGENTS_MD}"
BACKUP_DIR="${BACKUP_DIR}"
CREATED_DIR="${CREATED_DIR}"
COMMUNITY_DIR="${COMMUNITY_DIR}"
CLAWFLOWS_JSON="${CLAWFLOWS_JSON}"
SUBMISSIONS_DIR="${CLAWFLOWS_DIR}/community-submissions"
BIN_TARGET="\$HOME/.local/bin/clawflows"

START_MARKER="<!-- clawflows:start -->"
END_MARKER="<!-- clawflows:end -->"

EOF

    # Append the real CLI, skipping the config section
    # Start from _find_openclaw (before Helpers) so tests get the openclaw lookup
    awk '
        /^# ── Find openclaw/ { found=1 }
        found { print }
    ' "$REAL_CLI" >> "$TEST_CLI"

    chmod +x "$TEST_CLI"
}

# ============================================================================
# Workflow Creation Helpers
# ============================================================================

# create_workflow creates a workflow in the specified location
# Usage: create_workflow <location> <name> [emoji] [description] [schedule] [author]
# location: "community" or "created"
create_workflow() {
    local location="$1"
    local name="$2"
    local emoji="${3:-}"
    local description="${4:-A test workflow}"
    local schedule="${5:-}"
    local author="${6:-}"

    local target_dir
    if [[ "$location" == "community" ]]; then
        target_dir="${COMMUNITY_DIR}/1/${name}"
    elif [[ "$location" == "created" ]]; then
        target_dir="${CREATED_DIR}/${name}"
    else
        echo "Invalid location: $location" >&2
        return 1
    fi

    mkdir -p "$target_dir"

    # Build YAML frontmatter
    local content="---
name: ${name}"

    if [[ -n "$emoji" ]]; then
        content="${content}
emoji: \"${emoji}\""
    fi

    content="${content}
description: ${description}"

    if [[ -n "$schedule" ]]; then
        content="${content}
schedule: \"${schedule}\""
    fi

    if [[ -n "$author" ]]; then
        content="${content}
author: ${author}"
    fi

    content="${content}
---

# ${name}

This is a test workflow for ${name}.
"

    printf '%s\n' "$content" > "${target_dir}/WORKFLOW.md"
}

# create_community_workflow creates a workflow in community/<username>/<name>/
# Usage: create_community_workflow <name> [emoji] [description] [schedule] [author] [username]
create_community_workflow() {
    local name="$1"
    local emoji="${2:-}"
    local description="${3:-A test workflow}"
    local schedule="${4:-}"
    local author="${5:-}"
    local username="${6:-testuser}"

    local target_dir="${COMMUNITY_DIR}/${username}/${name}"
    mkdir -p "$target_dir"

    # Build YAML frontmatter
    local content="---
name: ${name}"

    if [[ -n "$emoji" ]]; then
        content="${content}
emoji: \"${emoji}\""
    fi

    content="${content}
description: ${description}"

    if [[ -n "$schedule" ]]; then
        content="${content}
schedule: \"${schedule}\""
    fi

    if [[ -n "$author" ]]; then
        content="${content}
author: ${author}"
    fi

    content="${content}
---

# ${name}

This is a test workflow for ${name}.
"

    printf '%s\n' "$content" > "${target_dir}/WORKFLOW.md"
}

# create_custom_workflow is a convenience wrapper (calls with "created" location)
create_custom_workflow() {
    create_workflow "created" "$@"
}

# enable_workflow adds an entry to registry.json
enable_workflow() {
    local name="$1"
    local source_dir=""
    local source=""
    local rel_path=""
    local schedule=""
    local agent_id=""
    local username=""

    if [[ -d "${CREATED_DIR}/${name}" ]]; then
        source_dir="${CREATED_DIR}/${name}"
        source="created"
        rel_path="created/${name}"
    else
        # Search community/*/<name>
        for agent_dir in "${COMMUNITY_DIR}"/*/; do
            if [[ -d "${agent_dir}${name}" ]]; then
                source_dir="${agent_dir}${name}"
                agent_id="$(basename "$agent_dir")"
                source="community"
                rel_path="community/${agent_id}/${name}"
                break
            fi
        done
    fi

    if [[ -z "${source_dir:-}" ]]; then
        echo "Workflow not found: $name" >&2
        return 1
    fi

    # Read schedule from WORKFLOW.md
    if [[ -f "${source_dir}/WORKFLOW.md" ]]; then
        schedule="$(awk '
            BEGIN { in_fm=0 }
            /^---$/ { in_fm++; next }
            in_fm == 1 && /^schedule:/ {
                sub(/^schedule:[ ]*/, "")
                gsub(/^["'"'"']|["'"'"']$/, "")
                print
                exit
            }
            in_fm >= 2 { exit }
        ' "${source_dir}/WORKFLOW.md")"
    fi

    local now
    now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

    local entry
    if [[ "$source" == "community" ]]; then
        entry="{\"name\":\"${name}\",\"schedule\":\"${schedule:-}\",\"path\":\"${rel_path}\",\"source\":\"community\",\"agent_id\":\"${agent_id}\",\"username\":\"${username:-}\",\"version\":1,\"created_at\":\"${now}\"}"
    else
        entry="{\"name\":\"${name}\",\"schedule\":\"${schedule:-}\",\"path\":\"${rel_path}\",\"source\":\"created\",\"created_at\":\"${now}\"}"
    fi

    # Add to registry.json using python3
    python3 -c "
import json
entry = json.loads('${entry}')
try:
    with open('${CLAWFLOWS_JSON}', 'r') as f:
        data = json.load(f)
except:
    data = []
data = [e for e in data if e.get('name') != entry.get('name')]
data.append(entry)
with open('${CLAWFLOWS_JSON}', 'w') as f:
    json.dump(data, f, indent=2)
" 2>/dev/null
}

# ============================================================================
# AGENTS.md Helpers
# ============================================================================

# setup_agents_md creates an AGENTS.md with optional existing content
setup_agents_md() {
    local existing_content="${1:-}"

    if [[ -n "$existing_content" ]]; then
        printf '%s\n' "$existing_content" > "$AGENTS_MD"
    else
        # Create with clawflows markers
        cat > "$AGENTS_MD" << 'EOF'
# Agent Instructions

Some existing content above clawflows.

<!-- clawflows:start -->
<!-- clawflows:end -->

Some existing content below clawflows.
EOF
    fi
}

# agents_md_contains checks if AGENTS.md contains a string
agents_md_contains() {
    local pattern="$1"
    grep -q "$pattern" "$AGENTS_MD"
}

# ============================================================================
# Assertion Helpers
# ============================================================================

# assert_workflow_exists checks that a workflow exists in a location
assert_workflow_exists() {
    local location="$1"
    local name="$2"

    local dir
    case "$location" in
        community) dir="${COMMUNITY_DIR}/1/${name}" ;;
        created) dir="${CREATED_DIR}/${name}" ;;
        *) fail "Invalid location: $location" ;;
    esac

    [[ -e "$dir" ]] || fail "Expected workflow to exist: $dir"
    [[ -f "${dir}/WORKFLOW.md" ]] || fail "Expected WORKFLOW.md at: ${dir}/WORKFLOW.md"
}

# assert_workflow_not_exists checks that a workflow does not exist
assert_workflow_not_exists() {
    local location="$1"
    local name="$2"

    local dir
    case "$location" in
        community) dir="${COMMUNITY_DIR}/1/${name}" ;;
        created) dir="${CREATED_DIR}/${name}" ;;
        *) fail "Invalid location: $location" ;;
    esac

    [[ ! -e "$dir" ]] || fail "Expected workflow to not exist: $dir"
}

# assert_workflow_enabled checks that a workflow is in registry.json
assert_workflow_enabled() {
    local name="$1"
    local result
    result="$(python3 -c "
import json
with open('${CLAWFLOWS_JSON}', 'r') as f:
    data = json.load(f)
for e in data:
    if e.get('name') == '$name':
        print('found')
        break
" 2>/dev/null)"
    [[ "$result" == "found" ]] || fail "Expected workflow '$name' to be enabled in registry.json"
}

# assert_workflow_not_enabled checks that a workflow is NOT in registry.json
assert_workflow_not_enabled() {
    local name="$1"
    local result
    result="$(python3 -c "
import json
with open('${CLAWFLOWS_JSON}', 'r') as f:
    data = json.load(f)
for e in data:
    if e.get('name') == '$name':
        print('found')
        break
" 2>/dev/null)"
    [[ "$result" != "found" ]] || fail "Expected workflow '$name' to NOT be enabled in registry.json"
}

# assert_is_directory checks that a path is a real directory (not symlink)
assert_is_directory() {
    local path="$1"
    [[ -d "$path" && ! -L "$path" ]] || fail "Expected directory (not symlink): $path"
}

# ============================================================================
# CLI Execution Helpers
# ============================================================================

# run_clawflows runs the test CLI with given arguments
# Results are in $output, $status, $lines (standard BATS run behavior)
run_clawflows() {
    run "$TEST_CLI" "$@"
}

# ============================================================================
# Fixture Helpers
# ============================================================================

# Copy fixtures from tests/fixtures to test environment
copy_fixture() {
    local fixture_name="$1"
    local dest_location="$2"  # "community" or "created"

    local fixture_path="${TESTS_DIR}/fixtures/${fixture_name}"
    local dest_dir

    if [[ "$dest_location" == "community" ]]; then
        dest_dir="${COMMUNITY_DIR}/1/${fixture_name}"
    else
        dest_dir="${CREATED_DIR}/${fixture_name}"
    fi

    cp -r "$fixture_path" "$dest_dir"
}

# ============================================================================
# JSON Helpers (for create --from-json tests)
# ============================================================================

# create_json builds a JSON string for workflow creation
create_json() {
    local name="$1"
    local summary="$2"
    local description="$3"
    local emoji="${4:-}"
    local schedule="${5:-}"
    local author="${6:-}"

    local json="{\"name\": \"${name}\", \"summary\": \"${summary}\", \"description\": \"${description}\""

    [[ -n "$emoji" ]] && json="${json}, \"emoji\": \"${emoji}\""
    [[ -n "$schedule" ]] && json="${json}, \"schedule\": \"${schedule}\""
    [[ -n "$author" ]] && json="${json}, \"author\": \"${author}\""

    json="${json}}"
    echo "$json"
}

# ============================================================================
# Backup Helpers
# ============================================================================

# create_test_backup creates a backup file for restore tests
create_test_backup() {
    local backup_name="${1:-test-backup.tar.gz}"
    local workflows=("${@:2}")  # Remaining args are workflow names

    local temp_dir
    temp_dir=$(mktemp -d)

    mkdir -p "${temp_dir}/created"

    # Create workflow directories in backup
    for wf in "${workflows[@]}"; do
        mkdir -p "${temp_dir}/created/${wf}"
        cat > "${temp_dir}/created/${wf}/WORKFLOW.md" << EOF
---
name: ${wf}
emoji: "📦"
description: Backup test workflow ${wf}
---

# ${wf}

Restored from backup.
EOF
    done

    # Create enabled list
    printf '%s\n' "${workflows[@]}" > "${temp_dir}/enabled-workflows.txt"

    # Create registry
    local registry="["
    local first=true
    local now
    now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    for wf in "${workflows[@]}"; do
        if $first; then
            first=false
        else
            registry="$registry,"
        fi
        registry="$registry{\"name\":\"${wf}\",\"schedule\":\"\",\"path\":\"created/${wf}\",\"source\":\"created\",\"created_at\":\"${now}\"}"
    done
    registry="$registry]"
    printf '%s' "$registry" > "${temp_dir}/registry.json"

    # Create tarball
    tar -czf "${BACKUP_DIR}/${backup_name}" -C "$temp_dir" created enabled-workflows.txt registry.json

    rm -rf "$temp_dir"

    echo "${BACKUP_DIR}/${backup_name}"
}

# ============================================================================
# Run History Helpers
# ============================================================================

# create_test_run creates a run marker file
# Usage: create_test_run <workflow-name> <date> <time> [log-content]
create_test_run() {
    local name="$1" date="$2" time="$3" log="${4:-}"
    mkdir -p "${CLAWFLOWS_DIR}/system/runs/${date}/${name}"
    if [ -n "$log" ]; then
        printf '%s' "$log" > "${CLAWFLOWS_DIR}/system/runs/${date}/${name}/${time}"
    else
        touch "${CLAWFLOWS_DIR}/system/runs/${date}/${name}/${time}"
    fi
}

# ============================================================================
# Mock Helpers
# ============================================================================

# mock_openclaw creates a fake openclaw command via the OPENCLAW_CMD env var.
# This controls _find_openclaw() so hardcoded path fallbacks can't find a real openclaw.
mock_openclaw() {
    local behavior="${1:-success}"  # success, fail, or missing

    if [[ "$behavior" == "missing" ]]; then
        # OPENCLAW_CMD="" tells _find_openclaw to return empty (not found)
        export OPENCLAW_CMD=""
        return
    fi

    mkdir -p "${TEST_TMPDIR}/bin"

    local log_file="${TEST_TMPDIR}/openclaw.log"

    if [[ "$behavior" == "success" ]]; then
        cat > "${TEST_TMPDIR}/bin/openclaw" << EOF
#!/bin/bash
echo "\$*" >> "${log_file}"
echo "Mock openclaw: \$*"
exit 0
EOF
    elif [[ "$behavior" == "cron-exists" ]]; then
        # Simulates scheduler already set up
        cat > "${TEST_TMPDIR}/bin/openclaw" << EOF
#!/bin/bash
echo "\$*" >> "${log_file}"
if [[ "\$1" == "cron" && "\$2" == "list" ]]; then
    echo "clawflows-scheduler  */15 * * * *"
else
    echo "Mock openclaw: \$*"
fi
exit 0
EOF
    else
        cat > "${TEST_TMPDIR}/bin/openclaw" << EOF
#!/bin/bash
echo "\$*" >> "${log_file}"
echo "Mock openclaw failed: \$*" >&2
exit 1
EOF
    fi

    chmod +x "${TEST_TMPDIR}/bin/openclaw"
    export OPENCLAW_CMD="${TEST_TMPDIR}/bin/openclaw"
}

# mock_editor creates a fake editor that just touches the file
mock_editor() {
    mkdir -p "${TEST_TMPDIR}/bin"
    cat > "${TEST_TMPDIR}/bin/mock-editor" << 'EOF'
#!/bin/bash
# Just touch the file to simulate editing
touch "$1"
exit 0
EOF
    chmod +x "${TEST_TMPDIR}/bin/mock-editor"
    export EDITOR="${TEST_TMPDIR}/bin/mock-editor"
}

# mock_git creates a fake git command for update tests
mock_git() {
    local behavior="${1:-success}"

    mkdir -p "${TEST_TMPDIR}/bin"

    if [[ "$behavior" == "success" ]]; then
        cat > "${TEST_TMPDIR}/bin/git" << 'EOF'
#!/bin/bash
echo "Mock git: $*"
exit 0
EOF
    else
        cat > "${TEST_TMPDIR}/bin/git" << 'EOF'
#!/bin/bash
echo "Mock git failed: $*" >&2
exit 1
EOF
    fi

    chmod +x "${TEST_TMPDIR}/bin/git"
    export PATH="${TEST_TMPDIR}/bin:${PATH}"
}
