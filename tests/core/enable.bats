#!/usr/bin/env bats
# Tests for the enable command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Enable Tests
# ============================================================================

@test "enable: enables a community workflow" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"

    run_clawflows enable test-workflow

    assert_success
    assert_output --partial "test-workflow enabled"
    assert [ -L "${ENABLED_DIR}/test-workflow" ]
}

@test "enable: shows description and schedule" {
    create_community_workflow "test-workflow" "🧪" "A test workflow" "9am"

    run_clawflows enable test-workflow

    assert_success
    assert_output --partial "🧪 test-workflow enabled"
    assert_output --partial "A test workflow"
    assert_output --partial "Runs daily at 9am"
}

@test "enable: shows on-demand hint for unscheduled workflow" {
    create_community_workflow "test-workflow" "🧪" "A test workflow"

    run_clawflows enable test-workflow

    assert_success
    assert_output --partial "On-demand"
    assert_output --partial "clawflows run test-workflow"
}

@test "enable: enables a custom workflow (takes priority)" {
    # Create both community and custom with same name
    create_community_workflow "test-workflow" "🌍" "Community version"
    create_custom_workflow "test-workflow" "🏠" "Custom version"

    run_clawflows enable test-workflow

    assert_success
    # Should link to custom, not community
    local target
    target="$(readlink "${ENABLED_DIR}/test-workflow")"
    assert [ "$target" = "${CUSTOM_DIR}/test-workflow" ]
}

@test "enable: already-enabled workflow is idempotent" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    enable_workflow "test-workflow"

    run_clawflows enable test-workflow

    assert_success
    assert_output --partial "already enabled: test-workflow"
}

@test "enable: non-existent workflow fails" {
    run_clawflows enable nonexistent-workflow

    assert_failure
    assert_output --partial "workflow 'nonexistent-workflow' not found"
}

@test "enable: creates valid symlink to source directory" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"

    run_clawflows enable test-workflow

    assert_success
    assert_is_symlink "${ENABLED_DIR}/test-workflow"
    assert_symlink_target "${ENABLED_DIR}/test-workflow" "${COMMUNITY_DIR}/test-workflow"
}

@test "enable: calls sync-agent" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"
    setup_agents_md

    run_clawflows enable test-workflow

    assert_success
    # Sync runs silently now — verify AGENTS.md was updated
    agents_md_contains "test-workflow"
}

@test "enable: with no argument fails" {
    run_clawflows enable

    assert_failure
    assert_output --partial "usage: clawflows enable <name>"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "enable: workflow with custom already enabled links to custom" {
    create_community_workflow "my-workflow" "🌍" "Community version"
    create_custom_workflow "my-workflow" "🏠" "Custom version"

    run_clawflows enable my-workflow

    assert_success
    local target
    target="$(readlink "${ENABLED_DIR}/my-workflow")"
    [[ "$target" == *"custom"* ]]
}

@test "enable: multiple workflows can be enabled" {
    create_community_workflow "workflow-a" "🅰️" "Workflow A"
    create_community_workflow "workflow-b" "🅱️" "Workflow B"

    run_clawflows enable workflow-a
    assert_success

    run_clawflows enable workflow-b
    assert_success

    assert [ -L "${ENABLED_DIR}/workflow-a" ]
    assert [ -L "${ENABLED_DIR}/workflow-b" ]
}
