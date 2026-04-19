#!/usr/bin/env bats
# Tests for the create command (--from-json mode)

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Create --from-json Tests
# ============================================================================

@test "create --from-json: creates workflow with all required fields" {
    local json='{"name": "test-workflow", "summary": "Test summary", "description": "Full description"}'

    run_clawflows create --from-json "$json"

    assert_success
    assert_output --partial "Created"
    assert [ -f "${CUSTOM_DIR}/test-workflow/WORKFLOW.md" ]
}

@test "create --from-json: generates correct WORKFLOW.md content" {
    local json='{"name": "my-test", "summary": "One line summary", "description": "Detailed description here"}'

    run_clawflows create --from-json "$json"

    assert_success

    # Check file content
    run cat "${CUSTOM_DIR}/my-test/WORKFLOW.md"
    assert_output --partial "name: my-test"
    assert_output --partial "description: One line summary"
    assert_output --partial "Detailed description here"
}

@test "create --from-json: auto-enables new workflow" {
    local json='{"name": "auto-enabled", "summary": "Auto enable test", "description": "Should be enabled"}'

    run_clawflows create --from-json "$json"

    assert_success
    assert_output --partial "auto-enabled enabled"
    assert [ -L "${ENABLED_DIR}/auto-enabled" ]
}

@test "create --from-json: with missing name fails" {
    local json='{"summary": "Test summary", "description": "Full description"}'

    run_clawflows create --from-json "$json"

    assert_failure
    assert_output --partial "Missing required field: name"
}

@test "create --from-json: with missing summary fails" {
    local json='{"name": "test", "description": "Full description"}'

    run_clawflows create --from-json "$json"

    assert_failure
    assert_output --partial "Missing required field: summary"
}

@test "create --from-json: with missing description fails" {
    local json='{"name": "test", "summary": "Test summary"}'

    run_clawflows create --from-json "$json"

    assert_failure
    assert_output --partial "Missing required field: description"
}

@test "create --from-json: with duplicate name fails" {
    create_community_workflow "existing-workflow" "🧪" "Existing workflow"
    local json='{"name": "existing-workflow", "summary": "Duplicate", "description": "Should fail"}'

    run_clawflows create --from-json "$json"

    assert_failure
    assert_output --partial "already exists"
}

@test "create --from-json: includes schedule when provided" {
    local json='{"name": "scheduled-wf", "summary": "Scheduled workflow", "description": "Runs at 9am", "schedule": "9am"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/scheduled-wf/WORKFLOW.md"
    assert_output --partial 'schedule: "9am"'
}

@test "create --from-json: includes emoji when provided" {
    local json='{"name": "emoji-wf", "summary": "Emoji workflow", "description": "Has custom emoji", "emoji": "🚀"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/emoji-wf/WORKFLOW.md"
    assert_output --partial 'emoji: "🚀"'
}

@test "create --from-json: defaults emoji to wrench if not provided" {
    local json='{"name": "no-emoji", "summary": "No emoji provided", "description": "Should get default"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/no-emoji/WORKFLOW.md"
    assert_output --partial 'emoji: "🔧"'
}

@test "create --from-json: includes author when provided" {
    local json='{"name": "authored-wf", "summary": "Authored workflow", "description": "Has author", "author": "@testuser"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/authored-wf/WORKFLOW.md"
    assert_output --partial "author: @testuser"
}

@test "create --from-json: with empty json fails" {
    run_clawflows create --from-json ""

    assert_failure
    assert_output --partial "No JSON provided"
}

# ============================================================================
# Interactive Create Tests
# ============================================================================

@test "create interactive: shows generic workflow hint in description prompt" {
    # Pipe answers to the interactive prompts:
    # name, emoji, summary, schedule, author, description, blank line to end
    local input="test-wf
💧
Test summary

@test
Do something useful

"
    run_clawflows create <<< "$input"

    assert_success
    assert_output --partial "Keep it generic"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "create --from-json: with extra whitespace in json works" {
    local json='{ "name" :  "spaced-wf" , "summary" :  "Has spaces" , "description" :  "Whitespace test" }'

    run_clawflows create --from-json "$json"

    assert_success
    assert [ -f "${CUSTOM_DIR}/spaced-wf/WORKFLOW.md" ]
}

@test "create --from-json: generates title from name" {
    local json='{"name": "my-cool-workflow", "summary": "Cool workflow", "description": "Detailed"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/my-cool-workflow/WORKFLOW.md"
    # Should have title case heading
    assert_output --partial "# My Cool Workflow"
}

# Regression for issue #15: descriptions containing escaped quotes used to
# get truncated at the first `\"` because the JSON regex used `[^"]*`, which
# stops at any `"` character including an escaped one. With jq installed the
# full description should survive.
@test "create --from-json: preserves escaped quotes in description" {
    if ! command -v jq >/dev/null 2>&1; then
        skip "jq not installed; the bash regex fallback cannot handle escaped quotes"
    fi

    local json='{"name":"quoted-desc","summary":"summary","description":"Log food with \"Breakfast\" and \"Dinner\" slots at \"08:30:00\""}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/quoted-desc/WORKFLOW.md"
    # The full description, with all three quoted fragments, must be present.
    assert_output --partial 'Log food with "Breakfast" and "Dinner" slots at "08:30:00"'
    # And the pre-fix truncation marker (description ending at the first `\"`)
    # must not appear -- if it did, the body would end with "Log food with "
    # and drop everything after it.
    refute_output --partial $'Log food with \n'
}

@test "create --from-json: preserves backslashes inside description" {
    if ! command -v jq >/dev/null 2>&1; then
        skip "jq not installed; the bash regex fallback cannot handle escaped characters"
    fi

    local json='{"name":"backslash-desc","summary":"summary","description":"Path uses \\\\ as separator"}'

    run_clawflows create --from-json "$json"

    assert_success
    run cat "${CUSTOM_DIR}/backslash-desc/WORKFLOW.md"
    assert_output --partial 'Path uses \\ as separator'
}
