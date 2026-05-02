#!/usr/bin/env bats
# Tests for the disable command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Disable Tests
# ============================================================================

@test "disable: disables an enabled workflow" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows disable test-workflow

    assert_success
    assert_output --partial "disabled: test-workflow"
    assert_workflow_not_enabled "test-workflow"
}

@test "disable: non-enabled workflow reports not enabled" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    # Don't enable it

    run_clawflows disable test-workflow

    assert_success
    assert_output --partial "not enabled: test-workflow"
}

@test "disable: removes from registry but not source files" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows disable test-workflow

    assert_success
    # Should not be in registry
    assert_workflow_not_enabled "test-workflow"
    # Source should still exist
    assert [ -d "${COMMUNITY_DIR}/testuser/test-workflow" ]
    assert [ -f "${COMMUNITY_DIR}/testuser/test-workflow/WORKFLOW.md" ]
}

@test "disable: calls sync-agent" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"
    setup_agents_md

    run_clawflows disable test-workflow

    assert_success
    assert_output --partial "synced AGENTS.md"
}

@test "disable: with no argument fails" {
    run_clawflows disable

    assert_failure
    assert_output --partial "usage: clawflows disable <name>"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "disable: preserves custom workflow after disable" {
    create_custom_workflow "my-custom" "🏠" "My custom workflow"
    enable_workflow "my-custom"

    run_clawflows disable my-custom

    assert_success
    # Custom workflow should still exist
    assert [ -d "${CREATED_DIR}/my-custom" ]
    assert [ -f "${CREATED_DIR}/my-custom/WORKFLOW.md" ]
}

@test "disable: can disable and re-enable" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows disable test-workflow
    assert_success
    assert_workflow_not_enabled "test-workflow"

    run_clawflows enable test-workflow
    assert_success
    assert_workflow_enabled "test-workflow"
}

@test "disable: workflow not in available still reports not enabled" {
    # This workflow doesn't exist anywhere
    run_clawflows disable totally-fake-workflow

    assert_success
    assert_output --partial "not enabled: totally-fake-workflow"
}
