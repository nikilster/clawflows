#!/usr/bin/env bats
# Tests for the logs command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# No Runs
# ============================================================================

@test "logs: no runs directory shows message" {
    run_clawflows logs

    assert_success
    assert_output --partial "No runs yet"
}

@test "logs: filter by nonexistent workflow shows message" {
    create_test_run "some-workflow" "2026-03-08" "07:00" "Did stuff"

    run_clawflows logs nonexistent-workflow

    assert_success
    assert_output --partial "No runs found for 'nonexistent-workflow'"
}

# ============================================================================
# Runs With Log Content
# ============================================================================

@test "logs: shows log content from run file" {
    create_community_workflow "test-wf" "🧪" "Test workflow"
    create_test_run "test-wf" "2026-03-08" "07:00" "Sent briefing: 65°F, 3 meetings"

    run_clawflows logs

    assert_success
    assert_output --partial "test-wf"
    assert_output --partial "Sent briefing: 65°F, 3 meetings"
}

@test "logs: empty run file shows no log recorded" {
    create_community_workflow "test-wf" "🧪" "Test workflow"
    create_test_run "test-wf" "2026-03-08" "07:00"

    run_clawflows logs

    assert_success
    assert_output --partial "(no log recorded)"
}

@test "logs: shows emoji from workflow" {
    create_community_workflow "test-wf" "🧪" "Test workflow"
    create_test_run "test-wf" "2026-03-08" "07:00" "Did stuff"

    run_clawflows logs

    assert_success
    assert_output --partial "🧪"
}

@test "logs: unknown workflow uses default emoji" {
    create_test_run "deleted-wf" "2026-03-08" "07:00" "Did stuff"

    run_clawflows logs

    assert_success
    assert_output --partial "📄"
}

# ============================================================================
# Filtering
# ============================================================================

@test "logs: filter by workflow name" {
    create_test_run "wf-a" "2026-03-08" "07:00" "Log A"
    create_test_run "wf-b" "2026-03-08" "08:00" "Log B"

    run_clawflows logs wf-a

    assert_success
    assert_output --partial "wf-a"
    assert_output --partial "Log A"
    refute_output --partial "wf-b"
    refute_output --partial "Log B"
}

@test "logs: filter by workflow and date" {
    create_test_run "wf-a" "2026-03-07" "07:00" "Yesterday log"
    create_test_run "wf-a" "2026-03-08" "07:00" "Today log"

    run_clawflows logs wf-a 2026-03-08

    assert_success
    assert_output --partial "Today log"
    refute_output --partial "Yesterday log"
}

# ============================================================================
# Ordering
# ============================================================================

@test "logs: newest runs appear first" {
    create_test_run "wf-a" "2026-03-07" "07:00" "Older"
    create_test_run "wf-a" "2026-03-08" "09:00" "Newer"

    run_clawflows logs

    assert_success
    # Newer date should come first in output
    local newer_pos older_pos
    newer_pos="$(echo "$output" | grep -n "Newer" | head -1 | cut -d: -f1)"
    older_pos="$(echo "$output" | grep -n "Older" | head -1 | cut -d: -f1)"
    [ "$newer_pos" -lt "$older_pos" ]
}

# ============================================================================
# Header Format
# ============================================================================

@test "logs: header contains date, time, and workflow name" {
    create_test_run "my-wf" "2026-03-08" "14:30" "Some log"

    run_clawflows logs

    assert_success
    assert_output --partial "─── 2026-03-08 14:30"
    assert_output --partial "my-wf ───"
}

# ============================================================================
# Runs JSON (dashboard)
# ============================================================================

@test "logs: --runs-json includes log field" {
    create_test_run "test-wf" "2026-03-08" "07:00" "Sent briefing"

    # Copy dashboard files for the dashboard command
    mkdir -p "${CLAWFLOWS_DIR}/system/dashboard"
    cp "${TESTS_DIR}/../system/dashboard/template.html" "${CLAWFLOWS_DIR}/system/dashboard/template.html" 2>/dev/null || true
    cp "${TESTS_DIR}/../system/dashboard/server.js" "${CLAWFLOWS_DIR}/system/dashboard/server.js" 2>/dev/null || true
    export DASHBOARD_NO_OPEN=1

    run_clawflows dashboard --runs-json

    assert_success
    echo "$output" | grep -q '"log":"Sent briefing"'
}

@test "logs: --runs-json empty file has empty log" {
    create_test_run "test-wf" "2026-03-08" "07:00"

    mkdir -p "${CLAWFLOWS_DIR}/system/dashboard"
    cp "${TESTS_DIR}/../system/dashboard/template.html" "${CLAWFLOWS_DIR}/system/dashboard/template.html" 2>/dev/null || true
    cp "${TESTS_DIR}/../system/dashboard/server.js" "${CLAWFLOWS_DIR}/system/dashboard/server.js" 2>/dev/null || true
    export DASHBOARD_NO_OPEN=1

    run_clawflows dashboard --runs-json

    assert_success
    echo "$output" | grep -q '"log":""'
}

@test "logs: --runs-json escapes quotes in log content" {
    create_test_run "test-wf" "2026-03-08" "07:00" 'Said "hello" to user'

    mkdir -p "${CLAWFLOWS_DIR}/system/dashboard"
    cp "${TESTS_DIR}/../system/dashboard/template.html" "${CLAWFLOWS_DIR}/system/dashboard/template.html" 2>/dev/null || true
    cp "${TESTS_DIR}/../system/dashboard/server.js" "${CLAWFLOWS_DIR}/system/dashboard/server.js" 2>/dev/null || true
    export DASHBOARD_NO_OPEN=1

    run_clawflows dashboard --runs-json

    assert_success
    echo "$output" | grep -q '\\"hello\\"'
}

# ============================================================================
# cmd_run() captures output
# ============================================================================

@test "run: creates run file in system/runs" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"
    mock_openclaw "missing"

    run_clawflows run test-workflow

    assert_success
    # Should have created a run file for today
    local today
    today="$(date +%Y-%m-%d)"
    [ -d "${CLAWFLOWS_DIR}/system/runs/${today}/test-workflow" ]
}
