#!/usr/bin/env bats
# Tests for broken registry entry handling

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Broken Registry Entry Tests
# ============================================================================

@test "broken registry: list still works with valid entries" {
    create_community_workflow "valid-workflow" "✅" "Valid workflow"
    enable_workflow "valid-workflow"

    # Add a broken entry to the registry (points to non-existent path)
    python3 -c "
import json
data = json.load(open('${REGISTRY_FILE}'))
data.append({'name': 'broken-workflow', 'schedule': '', 'path': 'community/999/broken-workflow', 'source': 'community', 'created_at': '2026-01-01T00:00:00Z'})
json.dump(data, open('${REGISTRY_FILE}', 'w'), indent=2)
"

    run_clawflows list enabled

    assert_success
    assert_output --partial "valid-workflow"
}

@test "broken registry: run fails with clear error for missing file" {
    # Add a broken entry to the registry
    python3 -c "
import json
data = json.load(open('${REGISTRY_FILE}'))
data.append({'name': 'broken-workflow', 'schedule': '', 'path': 'community/999/broken-workflow', 'source': 'community', 'created_at': '2026-01-01T00:00:00Z'})
json.dump(data, open('${REGISTRY_FILE}', 'w'), indent=2)
"

    run_clawflows run broken-workflow

    assert_failure
    assert_output --partial "WORKFLOW.md not found"
}

@test "broken registry: sync-agent skips missing workflow files" {
    create_community_workflow "valid-workflow" "✅" "Valid workflow"
    enable_workflow "valid-workflow"

    # Add a broken entry
    python3 -c "
import json
data = json.load(open('${REGISTRY_FILE}'))
data.append({'name': 'broken-workflow', 'schedule': '', 'path': 'community/999/broken-workflow', 'source': 'community', 'created_at': '2026-01-01T00:00:00Z'})
json.dump(data, open('${REGISTRY_FILE}', 'w'), indent=2)
"
    touch "$AGENTS_MD"

    run_clawflows sync-agent

    assert_success
    run cat "$AGENTS_MD"
    assert_output --partial "valid-workflow"
    refute_output --partial "broken-workflow"
}

@test "broken registry: disable removes broken entry" {
    # Add a broken entry to the registry
    python3 -c "
import json
data = json.load(open('${REGISTRY_FILE}'))
data.append({'name': 'broken-workflow', 'schedule': '', 'path': 'community/999/broken-workflow', 'source': 'community', 'created_at': '2026-01-01T00:00:00Z'})
json.dump(data, open('${REGISTRY_FILE}', 'w'), indent=2)
"

    run_clawflows disable broken-workflow

    assert_success
    assert_workflow_not_enabled "broken-workflow"
}

@test "broken registry: source deleted after enable causes run failure" {
    create_community_workflow "temp-workflow" "🕐" "Temporary workflow"
    enable_workflow "temp-workflow"

    # Delete the source (simulates update removing a workflow)
    rm -rf "${COMMUNITY_DIR}/testuser/temp-workflow"

    # Now the registry entry points to missing file
    run_clawflows run temp-workflow

    assert_failure
    # Should fail because WORKFLOW.md not found
    assert_output --partial "not found"
}
