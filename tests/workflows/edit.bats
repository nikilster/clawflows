#!/usr/bin/env bats
# Tests for the edit command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Edit Tests
# ============================================================================

@test "edit: copies installed workflow to created" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"

    run_clawflows edit test-workflow

    assert_success
    assert_output --partial "copied to created/"
    assert [ -d "${CREATED_DIR}/test-workflow" ]
    assert [ -f "${CREATED_DIR}/test-workflow/WORKFLOW.md" ]
}

@test "edit: workflow already in created shows path" {
    create_custom_workflow "my-custom" "🏠" "Custom workflow"

    run_clawflows edit my-custom

    assert_success
    assert_output --partial "workflow is in created/"
    assert_output --partial "${CREATED_DIR}/my-custom/WORKFLOW.md"
}

@test "edit: updates symlink to created version if enabled" {
    create_installed_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    # Verify it points to installed first
    local before_target
    before_target="$(readlink "${ENABLED_DIR}/test-workflow")"
    [[ "$before_target" == *"installed"* ]]

    run_clawflows edit test-workflow

    assert_success
    assert_output --partial "updated symlink to created version"

    # Now should point to created
    local after_target
    after_target="$(readlink "${ENABLED_DIR}/test-workflow")"
    [[ "$after_target" == *"created"* ]]
}

@test "edit: non-existent workflow fails" {
    run_clawflows edit nonexistent-workflow

    assert_failure
    assert_output --partial "workflow 'nonexistent-workflow' not found"
}

@test "edit: with no argument fails" {
    run_clawflows edit

    assert_failure
    assert_output --partial "usage: clawflows edit <name>"
}

# ============================================================================
# Content Preservation Tests
# ============================================================================

@test "edit: preserves workflow content when copying" {
    create_installed_workflow "test-workflow" "🧪" "Original description"

    run_clawflows edit test-workflow

    assert_success

    # Content should match
    run cat "${CREATED_DIR}/test-workflow/WORKFLOW.md"
    assert_output --partial "Original description"
}
