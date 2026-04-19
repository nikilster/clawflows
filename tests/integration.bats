#!/usr/bin/env bats
# Integration tests for full workflow lifecycles

load 'test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Full Lifecycle Tests
# ============================================================================

@test "lifecycle: create -> enable -> run -> disable" {
    mock_openclaw "missing"

    # Create a workflow via JSON
    local json='{"name": "lifecycle-test", "summary": "Lifecycle test", "description": "Test the full lifecycle"}'
    run_clawflows create --from-json "$json"
    assert_success
    assert_output --partial "lifecycle-test enabled"

    # Verify it's enabled
    run_clawflows list enabled
    assert_success
    assert_output --partial "lifecycle-test"

    # Run it (fallback mode)
    run_clawflows run lifecycle-test
    assert_success
    assert_output --partial "Workflow ready"

    # Disable it
    run_clawflows disable lifecycle-test
    assert_success
    assert_output --partial "disabled: lifecycle-test"

    # Verify it's no longer enabled
    run_clawflows list enabled
    assert_success
    refute_output --partial "lifecycle-test"

    # But it should still be available
    run_clawflows list available
    assert_success
    assert_output --partial "lifecycle-test"
}

@test "lifecycle: custom overrides installed by name" {
    # Create installed workflow
    create_installed_workflow "shared-workflow" "🌍" "Installed version"
    enable_workflow "shared-workflow"

    # Verify installed version is enabled
    run_clawflows list enabled
    assert_success
    assert_output --partial "shared-workflow"

    # Edit to create custom version
    run_clawflows edit shared-workflow
    assert_success
    assert_output --partial "copied to created"

    # Custom should now shadow installed
    run_clawflows list
    assert_success
    assert_output --partial "shared-workflow"
}

@test "lifecycle: backup -> delete custom -> restore" {
    # Create and enable custom workflow
    create_custom_workflow "precious-workflow" "💎" "Precious custom workflow"
    enable_workflow "precious-workflow"

    # Backup
    run_clawflows backup "pre-delete-backup"
    assert_success

    # Verify backup exists
    assert [ -f "${BACKUP_DIR}/pre-delete-backup.tar.gz" ]

    # Delete the custom workflow
    rm -rf "${CREATED_DIR}/precious-workflow"
    run_clawflows disable precious-workflow

    # Verify it's gone
    run_clawflows list
    refute_output --partial "precious-workflow"

    # Restore
    run_clawflows restore "pre-delete-backup.tar.gz"
    assert_success
    assert_output --partial "Restored 1"

    # Verify it's back
    assert [ -d "${CREATED_DIR}/precious-workflow" ]
}

@test "lifecycle: multiple workflows enabled" {
    # Create installed workflows
    create_installed_workflow "workflow-1" "1️⃣" "First workflow"
    create_installed_workflow "workflow-2" "2️⃣" "Second workflow"
    create_custom_workflow "workflow-3" "3️⃣" "Third workflow"

    # Enable all
    run_clawflows enable workflow-1
    assert_success
    run_clawflows enable workflow-2
    assert_success
    run_clawflows enable workflow-3
    assert_success

    # Verify all enabled
    run_clawflows list enabled
    assert_success
    assert_output --partial "workflow-1"
    assert_output --partial "workflow-2"
    assert_output --partial "workflow-3"

    # Sync should include all
    touch "$AGENTS_MD"
    run_clawflows sync-agent
    assert_success
    run cat "$AGENTS_MD"
    assert_output --partial "workflow-1"
    assert_output --partial "workflow-2"
    assert_output --partial "workflow-3"
}

# ============================================================================
# Error Recovery Tests
# ============================================================================

@test "recovery: enable after disable" {
    create_installed_workflow "toggle-workflow" "🔄" "Toggle test"

    run_clawflows enable toggle-workflow
    assert_success

    run_clawflows disable toggle-workflow
    assert_success

    run_clawflows enable toggle-workflow
    assert_success

    assert_workflow_enabled "toggle-workflow"
}

@test "recovery: workflow still works after backup/restore cycle" {
    mock_openclaw "missing"
    create_custom_workflow "cycle-workflow" "♻️" "Cycle test"
    enable_workflow "cycle-workflow"

    # Backup
    run_clawflows backup
    assert_success

    # Restore (should skip existing)
    run_clawflows restore latest
    assert_success

    # Should still work
    run_clawflows run cycle-workflow
    assert_success
}
