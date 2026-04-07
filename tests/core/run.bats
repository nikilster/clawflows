#!/usr/bin/env bats
# Tests for the run command

load '../test_helper'

setup() {
    setup_test_environment
    mock_openclaw "missing"  # Default: openclaw not available
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Run Tests
# ============================================================================

@test "run: runs enabled workflow (fallback mode without openclaw)" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows run test-workflow

    assert_success
    assert_output --partial "Workflow ready: test-workflow"
    assert_output --partial "Run test-workflow"
}

@test "run: auto-enables installed workflow if not enabled" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    # Don't enable it

    run_clawflows run test-workflow

    assert_success
    assert_output --partial "Enabling test-workflow"
    assert_workflow_enabled "test-workflow"
}

@test "run: auto-enables custom workflow if not enabled" {
    create_custom_workflow "my-custom" "🏠" "My custom workflow"
    # Don't enable it

    run_clawflows run my-custom

    assert_success
    assert_output --partial "Enabling my-custom"
    assert_workflow_enabled "my-custom"
}

@test "run: non-existent workflow fails" {
    run_clawflows run nonexistent-workflow

    assert_failure
    assert_output --partial "workflow 'nonexistent-workflow' not found"
}

@test "run: with no argument fails" {
    run_clawflows run

    assert_failure
    assert_output --partial "usage: clawflows run <name>"
}

# ============================================================================
# OpenClaw Integration Tests
# ============================================================================

@test "run: uses openclaw when available" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"
    mock_openclaw "success"

    run_clawflows run test-workflow

    assert_success
    assert_output --partial "Running test-workflow"
    assert_output --partial "Mock openclaw"
}

@test "run: fallback without openclaw shows instructions" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"
    mock_openclaw "missing"

    run_clawflows run test-workflow

    assert_success
    assert_output --partial "To run it, tell your agent"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "run: with missing WORKFLOW.md fails" {
    # Create directory but not WORKFLOW.md, add to registry manually
    mkdir -p "${INSTALLED_DIR}/testuser/broken-workflow"
    python3 -c "
import json
data = json.load(open('${REGISTRY_FILE}'))
data.append({'name': 'broken-workflow', 'schedule': '', 'path': 'installed/testuser/broken-workflow', 'source': 'installed', 'created_at': '2026-01-01T00:00:00Z'})
json.dump(data, open('${REGISTRY_FILE}', 'w'), indent=2)
"

    run_clawflows run broken-workflow

    assert_failure
    assert_output --partial "WORKFLOW.md not found"
}

@test "run: prefers custom over installed" {
    create_installed_workflow "shared-name" "🌍" "Installed version"
    create_custom_workflow "shared-name" "🏠" "Custom version"
    # Neither enabled yet

    run_clawflows run shared-name

    assert_success
    # Should have enabled the custom one
    local reg_path
    reg_path="$(python3 -c "
import json
with open('${REGISTRY_FILE}', 'r') as f:
    data = json.load(f)
for e in data:
    if e.get('name') == 'shared-name':
        print(e.get('path', ''))
        break
")"
    [[ "$reg_path" == *"created"* ]]
}

@test "run: creates run file in system/runs" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows run test-workflow

    assert_success
    # Check that a run file was created
    local today
    today="$(date +%Y-%m-%d)"
    [ -d "${CLAWFLOWS_DIR}/system/runs/$today/test-workflow" ]
}
