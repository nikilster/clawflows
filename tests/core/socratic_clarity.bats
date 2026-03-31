#!/usr/bin/env bats
# Tests for socratic-clarity community workflow

load '../test_helper'

setup() {
    setup_test_environment
    create_community_workflow "socratic-clarity" "🏛️" "Socratic questioning to sharpen your thinking on a problem or design decision"
    setup_agents_md
}

teardown() {
    teardown_test_environment
}

@test "socratic-clarity workflow exists in community" {
    assert_workflow_exists community socratic-clarity
}

@test "socratic-clarity can be enabled" {
    run_clawflows enable socratic-clarity
    assert_success
    assert_workflow_exists enabled socratic-clarity
}

@test "socratic-clarity creates correct symlink" {
    run_clawflows enable socratic-clarity
    assert_success
    assert_is_symlink "${ENABLED_DIR}/socratic-clarity"
    assert_symlink_target "${ENABLED_DIR}/socratic-clarity" "${COMMUNITY_DIR}/socratic-clarity"
}

@test "socratic-clarity can be disabled" {
    enable_workflow socratic-clarity
    run_clawflows disable socratic-clarity
    assert_success
    assert_workflow_not_exists enabled socratic-clarity
}

@test "socratic-clarity appears in list" {
    run_clawflows list
    assert_success
    assert_output --partial "socratic-clarity"
}

@test "socratic-clarity shows in agent sync after enable" {
    run_clawflows enable socratic-clarity
    assert_success
    agents_md_contains "socratic-clarity"
}
