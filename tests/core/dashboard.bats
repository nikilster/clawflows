#!/usr/bin/env bats
# Tests for the dashboard command

load '../test_helper'

setup() {
    setup_test_environment

    # Copy the dashboard template and server into the test environment
    mkdir -p "${CLAWFLOWS_DIR}/system/dashboard"
    cp "${TESTS_DIR}/../system/dashboard/template.html" "${CLAWFLOWS_DIR}/system/dashboard/template.html"
    cp "${TESTS_DIR}/../system/dashboard/server.js" "${CLAWFLOWS_DIR}/system/dashboard/server.js"

    # Prevent browser from opening during tests
    export DASHBOARD_NO_OPEN=1
}

teardown() {
    # Kill the dashboard process and its child node server via process group
    if [[ -n "${DASHBOARD_PID:-}" ]]; then
        kill -- -"$DASHBOARD_PID" 2>/dev/null || kill "$DASHBOARD_PID" 2>/dev/null || true
        wait "$DASHBOARD_PID" 2>/dev/null || true
    fi
    teardown_test_environment
}

# ============================================================================
# dashboard --json: Basic JSON Output
# ============================================================================

@test "dashboard --json: outputs valid JSON to stdout" {
    create_installed_workflow "check-email" "📧" "Check your email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email"'
    echo "$output" | grep -q '"description":"Check your email"'
}

@test "dashboard --json: includes multiple workflows" {
    create_installed_workflow "check-email" "📧" "Check your email"
    create_installed_workflow "send-news" "📰" "Daily news digest"
    create_installed_workflow "track-habits" "✅" "Track daily habits"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email"'
    echo "$output" | grep -q '"name":"send-news"'
    echo "$output" | grep -q '"name":"track-habits"'
}

# ============================================================================
# dashboard --json: Enabled / Available Split
# ============================================================================

@test "dashboard --json: enabled workflows marked true" {
    create_installed_workflow "check-email" "📧" "Check your email"
    enable_workflow "check-email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email".*"enabled":true'
}

@test "dashboard --json: non-enabled workflows marked false" {
    create_installed_workflow "check-email" "📧" "Check your email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email".*"enabled":false'
}

@test "dashboard --json: mix of enabled and available" {
    create_installed_workflow "check-email" "📧" "Check your email"
    create_installed_workflow "send-news" "📰" "Daily news"
    enable_workflow "check-email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email".*"enabled":true'
    echo "$output" | grep -q '"name":"send-news".*"enabled":false'
}

# ============================================================================
# dashboard --json: Source Types
# ============================================================================

@test "dashboard --json: custom workflows have source custom" {
    create_custom_workflow "my-workflow" "🔧" "My custom workflow"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"my-workflow".*"source":"custom"'
}

@test "dashboard --json: installed workflows have source installed" {
    create_installed_workflow "check-email" "📧" "Check email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email".*"source":"installed"'
}

# ============================================================================
# dashboard --json: Custom Override / Dedup
# ============================================================================

@test "dashboard --json: custom overrides installed by name" {
    create_installed_workflow "check-email" "📧" "Installed version"
    create_custom_workflow "check-email" "📧" "Custom version"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"name":"check-email".*"source":"custom"'
    ! echo "$output" | grep -q '"name":"check-email".*"source":"installed"'
}

@test "dashboard --json: custom override uses custom description" {
    create_installed_workflow "check-email" "📧" "Installed desc"
    create_custom_workflow "check-email" "📧" "Custom desc"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"description":"Custom desc"'
    ! echo "$output" | grep -q '"description":"Installed desc"'
}

# ============================================================================
# dashboard --json: Fields
# ============================================================================

@test "dashboard --json: includes emoji" {
    create_installed_workflow "send-news" "📰" "Daily news digest"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"emoji":"📰"'
}

@test "dashboard --json: includes schedule" {
    create_installed_workflow "send-briefing" "☀️" "Morning briefing" "7am"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"schedule":"7am"'
}

@test "dashboard --json: includes author" {
    create_installed_workflow "check-email" "📧" "Check email" "" "@dave"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q '"author":"@dave"'
}

@test "dashboard --json: includes workflow content" {
    create_installed_workflow "check-email" "📧" "Check email"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q 'This is a test workflow'
}

# ============================================================================
# dashboard --json: JSON Escaping
# ============================================================================

@test "dashboard --json: escapes double quotes in content" {
    create_installed_workflow "test-wf" "🧪" "Test workflow"
    printf -- '---\nname: test-wf\nemoji: 🧪\ndescription: Test workflow\n---\n\nSay "hello" to the world\n' \
        > "${INSTALLED_DIR}/testuser/test-wf/WORKFLOW.md"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q 'Say \\"hello\\" to the world'
}

@test "dashboard --json: escapes backslashes in content" {
    create_installed_workflow "test-wf" "🧪" "Test workflow"
    printf -- '---\nname: test-wf\nemoji: 🧪\ndescription: Test workflow\n---\n\nUse path C:\\Users\\test\n' \
        > "${INSTALLED_DIR}/testuser/test-wf/WORKFLOW.md"

    run_clawflows dashboard --json

    assert_success
    echo "$output" | grep -q 'C:\\\\Users\\\\test'
}

# ============================================================================
# dashboard --json: Empty State
# ============================================================================

@test "dashboard --json: works with no workflows" {
    run_clawflows dashboard --json

    assert_success
    [[ "$output" == "[]" ]]
}

# ============================================================================
# Dashboard Files
# ============================================================================

@test "dashboard: fails if template is missing" {
    rm -f "${CLAWFLOWS_DIR}/system/dashboard/template.html"

    run_clawflows dashboard

    assert_failure
    assert_output --partial "dashboard template not found"
}

@test "dashboard: fails if server.js is missing" {
    rm -f "${CLAWFLOWS_DIR}/system/dashboard/server.js"

    run_clawflows dashboard

    assert_failure
    assert_output --partial "dashboard server not found"
}

@test "dashboard: template.html exists" {
    [[ -f "${CLAWFLOWS_DIR}/system/dashboard/template.html" ]]
}

@test "dashboard: server.js exists" {
    [[ -f "${CLAWFLOWS_DIR}/system/dashboard/server.js" ]]
}

# ============================================================================
# Dashboard Server Integration
# ============================================================================

start_dashboard_server() {
    local port="${1:-0}"
    export DASHBOARD_PORT="$port"
    export DASHBOARD_NO_OPEN=1

    # Start dashboard in its own process group so teardown can kill
    # both the bash wrapper and the child node server via kill -- -PID
    set -m
    "$TEST_CLI" dashboard > "${TEST_TMPDIR}/dashboard-out.txt" 2>&1 &
    DASHBOARD_PID=$!
    set +m

    # Wait for server to start (look for URL in output)
    local attempts=0
    while [[ $attempts -lt 30 ]]; do
        if grep -q 'http://127.0.0.1' "${TEST_TMPDIR}/dashboard-out.txt" 2>/dev/null; then
            DASHBOARD_URL="$(grep -o 'http://127.0.0.1:[0-9]*' "${TEST_TMPDIR}/dashboard-out.txt" | head -1)"
            return 0
        fi
        sleep 0.1
        ((attempts++)) || true
    done
    return 1
}

@test "dashboard server: GET /api/workflows returns JSON" {
    create_installed_workflow "check-email" "📧" "Check your email"

    start_dashboard_server

    local response
    response="$(curl -s "$DASHBOARD_URL/api/workflows")"
    echo "$response" | grep -q '"name":"check-email"'
    echo "$response" | grep -q '"description":"Check your email"'
}

@test "dashboard server: GET / serves HTML" {
    create_installed_workflow "check-email" "📧" "Check email"

    start_dashboard_server

    local response
    response="$(curl -s "$DASHBOARD_URL/")"
    echo "$response" | grep -q '<!DOCTYPE html>'
    echo "$response" | grep -q 'ClawFlows'
}

@test "dashboard server: POST /api/enable enables a workflow" {
    create_installed_workflow "check-email" "📧" "Check your email"

    start_dashboard_server

    # Should not be enabled yet
    [[ ! -L "${ENABLED_DIR}/check-email" ]]

    # Enable via API
    local response
    response="$(curl -s -X POST "$DASHBOARD_URL/api/enable/check-email")"
    echo "$response" | grep -q '"ok":true'

    # Verify it's now enabled
    [[ -L "${ENABLED_DIR}/check-email" ]]
}

@test "dashboard server: POST /api/disable disables a workflow" {
    create_installed_workflow "check-email" "📧" "Check your email"
    enable_workflow "check-email"

    start_dashboard_server

    # Should be enabled
    [[ -L "${ENABLED_DIR}/check-email" ]]

    # Disable via API
    local response
    response="$(curl -s -X POST "$DASHBOARD_URL/api/disable/check-email")"
    echo "$response" | grep -q '"ok":true'

    # Verify it's now disabled
    [[ ! -L "${ENABLED_DIR}/check-email" ]]
}

@test "dashboard server: workflows update after enable/disable" {
    create_installed_workflow "check-email" "📧" "Check your email"

    start_dashboard_server

    # Initially not enabled
    local response
    response="$(curl -s "$DASHBOARD_URL/api/workflows")"
    echo "$response" | grep -q '"name":"check-email".*"enabled":false'

    # Enable it
    curl -s -X POST "$DASHBOARD_URL/api/enable/check-email" >/dev/null

    # Should now be enabled in the API response
    response="$(curl -s "$DASHBOARD_URL/api/workflows")"
    echo "$response" | grep -q '"name":"check-email".*"enabled":true'
}

# ============================================================================
# dashboard --runs-json: Run History JSON
# ============================================================================

@test "dashboard --runs-json: outputs empty array when no runs" {
    run_clawflows dashboard --runs-json

    assert_success
    [[ "$output" == "[]" ]]
}

@test "dashboard --runs-json: returns runs as JSON" {
    create_test_run "send-morning-briefing" "2026-02-24" "07:00"

    run_clawflows dashboard --runs-json

    assert_success
    echo "$output" | grep -q '"date":"2026-02-24"'
    echo "$output" | grep -q '"workflow":"send-morning-briefing"'
    echo "$output" | grep -q '"time":"07:00"'
}

@test "dashboard --runs-json: multiple dates sorted newest first" {
    create_test_run "check-email" "2026-02-22" "09:00"
    create_test_run "check-email" "2026-02-24" "09:00"
    create_test_run "check-email" "2026-02-23" "09:00"

    run_clawflows dashboard --runs-json

    assert_success
    # Verify 2026-02-24 appears before 2026-02-22 in the output
    local pos_24 pos_22
    pos_24="$(echo "$output" | grep -bo '2026-02-24' | head -1 | cut -d: -f1)"
    pos_22="$(echo "$output" | grep -bo '2026-02-22' | head -1 | cut -d: -f1)"
    [[ "$pos_24" -lt "$pos_22" ]]
}

@test "dashboard --runs-json: ignores non-date directories" {
    create_test_run "check-email" "2026-02-24" "09:00"
    mkdir -p "${CLAWFLOWS_DIR}/system/runs/junk-dir"
    touch "${CLAWFLOWS_DIR}/system/runs/junk-dir/something"

    run_clawflows dashboard --runs-json

    assert_success
    echo "$output" | grep -q '"date":"2026-02-24"'
    ! echo "$output" | grep -q 'junk-dir'
}

@test "dashboard server: GET /api/runs returns JSON" {
    create_test_run "send-morning-briefing" "2026-02-24" "07:00"

    start_dashboard_server

    local response
    response="$(curl -s "$DASHBOARD_URL/api/runs")"
    echo "$response" | grep -q '"workflow":"send-morning-briefing"'
    echo "$response" | grep -q '"date":"2026-02-24"'
    echo "$response" | grep -q '"time":"07:00"'
}

@test "dashboard server: 404 for unknown routes" {
    start_dashboard_server

    local http_code
    http_code="$(curl -s -o /dev/null -w '%{http_code}' "$DASHBOARD_URL/nonexistent")"
    [[ "$http_code" == "404" ]]
}
