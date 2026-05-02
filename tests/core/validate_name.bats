#!/usr/bin/env bats
# Tests for workflow name validation (path traversal prevention)

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Valid Names
# ============================================================================

@test "validate_name: accepts simple alphanumeric name" {
    create_community_workflow "check-email" "📧" "Check email"

    run_clawflows enable check-email

    assert_success
}

@test "validate_name: accepts name with underscores" {
    create_community_workflow "my_workflow" "🔧" "Test workflow"

    run_clawflows enable my_workflow

    assert_success
}

@test "validate_name: accepts name with dashes and numbers" {
    create_community_workflow "my-workflow-123" "🔧" "Test workflow"

    run_clawflows enable my-workflow-123

    assert_success
}

# ============================================================================
# Path Traversal Attacks
# ============================================================================

@test "validate_name: rejects parent directory traversal" {
    run_clawflows enable "../../etc/passwd"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects relative path traversal" {
    run_clawflows enable "../sensitive"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects names with slashes" {
    run_clawflows enable "bad/name"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects hidden directory names" {
    run_clawflows enable ".hidden"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects names with dots" {
    run_clawflows enable "some.name"

    assert_failure
    assert_output --partial "invalid workflow name"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "validate_name: rejects empty name" {
    run_clawflows enable ""

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects name starting with dash" {
    run_clawflows enable "-bad-start"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects name starting with underscore" {
    run_clawflows enable "_bad-start"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects name with spaces" {
    run_clawflows enable "bad name"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: rejects name exceeding 64 characters" {
    local long_name="a$(printf '%0.s1' {1..64})"

    run_clawflows enable "$long_name"

    assert_failure
    assert_output --partial "invalid workflow name"
}

# ============================================================================
# Validation Across Commands
# ============================================================================

@test "validate_name: disable rejects path traversal" {
    run_clawflows disable "../../etc"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: run rejects path traversal" {
    mock_openclaw

    run_clawflows run "../evil"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: validate rejects path traversal" {
    run_clawflows validate "../../etc"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: share rejects path traversal" {
    run_clawflows share "../evil"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: logs rejects path traversal" {
    run_clawflows logs "../../etc"

    assert_failure
    assert_output --partial "invalid workflow name"
}

@test "validate_name: create --from-json rejects path traversal" {
    local json='{"name":"../../evil","summary":"x","description":"x"}'

    run_clawflows create --from-json "$json"

    assert_failure
    assert_output --partial "invalid workflow name"
}
