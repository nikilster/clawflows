#!/usr/bin/env bats
# Tests for the share command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Share Tests
# ============================================================================

@test "share: outputs emoji, name, and description" {
    create_community_workflow "send-morning-briefing" "☀️" "Daily morning briefing"

    run_clawflows share send-morning-briefing

    assert_success
    assert_output --partial "☀️ send-morning-briefing"
    assert_output --partial "Daily morning briefing"
}

@test "share: includes import command with correct workflow name" {
    create_community_workflow "check-weather" "🌤️" "Check the weather"

    run_clawflows share check-weather

    assert_success
    assert_output --partial "clawflows import"
    assert_output --partial "check-weather/WORKFLOW.md"
}

@test "share: includes raw GitHub URL for community workflow" {
    create_community_workflow "test-workflow" "🧪" "Test workflow"

    run_clawflows share test-workflow

    assert_success
    assert_output --partial "https://raw.githubusercontent.com/nikilster/clawflows/main/workflows/available/community/test-workflow/WORKFLOW.md"
}

@test "share: non-existent workflow fails" {
    run_clawflows share nonexistent-workflow

    assert_failure
    assert_output --partial "workflow 'nonexistent-workflow' not found"
}

@test "share: with no argument fails" {
    run_clawflows share

    assert_failure
    assert_output --partial "usage: clawflows share <name>"
}

@test "share: works with custom workflow" {
    create_custom_workflow "my-custom-wf" "🏠" "My custom workflow"

    run_clawflows share my-custom-wf

    assert_success
    assert_output --partial "🏠 my-custom-wf"
    assert_output --partial "My custom workflow"
}

@test "share: custom takes priority over community" {
    create_community_workflow "test-wf" "🌍" "Community version"
    create_custom_workflow "test-wf" "🏠" "Custom version"

    run_clawflows share test-wf

    assert_success
    assert_output --partial "🏠 test-wf"
    assert_output --partial "Custom version"
}

@test "share: workflow without emoji still works" {
    create_community_workflow "no-emoji-wf" "" "No emoji here"

    run_clawflows share no-emoji-wf

    assert_success
    assert_output --partial "no-emoji-wf"
    assert_output --partial "No emoji here"
    assert_output --partial "clawflows import"
}
