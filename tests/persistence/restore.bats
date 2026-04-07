#!/usr/bin/env bats
# Tests for the restore command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic Restore Tests
# ============================================================================

@test "restore: extracts custom workflows" {
    # Create a backup
    create_test_backup "test-backup.tar.gz" "restored-workflow"

    run_clawflows restore "test-backup.tar.gz"

    assert_success
    assert [ -d "${CREATED_DIR}/restored-workflow" ]
    assert [ -f "${CREATED_DIR}/restored-workflow/WORKFLOW.md" ]
}

@test "restore: re-enables workflows from backup registry" {
    # Create installed workflow that will be re-enabled
    create_installed_workflow "inst-workflow" "🌍" "Installed workflow"

    # Create backup with that workflow in enabled list
    create_test_backup "test-backup.tar.gz" "inst-workflow"

    run_clawflows restore "test-backup.tar.gz"

    assert_success
}

@test "restore: skips existing custom workflows" {
    # Create backup with a workflow
    create_test_backup "test-backup.tar.gz" "my-custom"

    # Create the same workflow locally
    create_custom_workflow "my-custom" "🏠" "Local version"

    run_clawflows restore "test-backup.tar.gz"

    assert_success
    assert_output --partial "Skipped"

    # Should still have local version
    run cat "${CREATED_DIR}/my-custom/WORKFLOW.md"
    assert_output --partial "Local version"
}

@test "restore: with 'latest' keyword" {
    # Create multiple backups
    create_test_backup "clawflows-2024-01-01-000001.tar.gz" "old-workflow"
    create_test_backup "clawflows-2024-01-02-000001.tar.gz" "new-workflow"

    run_clawflows restore latest

    assert_success
    # Should restore from the newer backup (sorted reverse alphabetically)
    assert [ -d "${CREATED_DIR}/new-workflow" ]
}

@test "restore: with specific file path" {
    create_test_backup "specific-backup.tar.gz" "specific-workflow"

    run_clawflows restore "${BACKUP_DIR}/specific-backup.tar.gz"

    assert_success
    assert [ -d "${CREATED_DIR}/specific-workflow" ]
}

@test "restore: with corrupted backup restores nothing" {
    # Create an invalid tar.gz
    echo "not a valid archive" > "${BACKUP_DIR}/bad-backup.tar.gz"

    run_clawflows restore "bad-backup.tar.gz"

    # The restore runs but extracts nothing
    assert_output --partial "Restored 0"
}

@test "restore: no backups found" {
    # Empty backup dir
    rm -rf "${BACKUP_DIR}"/*

    run_clawflows restore

    assert_failure
    assert_output --partial "No backups found"
}

@test "restore: backup file not found" {
    run_clawflows restore "nonexistent.tar.gz"

    assert_failure
    assert_output --partial "backup not found"
}

# ============================================================================
# Edge Cases
# ============================================================================

@test "restore: workflow not in installed or custom is skipped from legacy enabled list" {
    # Create a backup with only enabled-workflows.txt (no clawflows.json) for legacy support
    local tmpdir
    tmpdir=$(mktemp -d)
    mkdir -p "${tmpdir}/created"
    echo "nonexistent-workflow" > "${tmpdir}/enabled-workflows.txt"
    tar -czf "${BACKUP_DIR}/orphan-backup.tar.gz" -C "$tmpdir" created enabled-workflows.txt
    rm -rf "$tmpdir"

    run_clawflows restore "orphan-backup.tar.gz"

    assert_success
    # Should not have enabled nonexistent workflow
    assert_workflow_not_enabled "nonexistent-workflow"
}

@test "restore: multiple custom workflows" {
    create_test_backup "multi-backup.tar.gz" "wf-1" "wf-2" "wf-3"

    run_clawflows restore "multi-backup.tar.gz"

    assert_success
    assert_output --partial "Restored 3"
    assert [ -d "${CREATED_DIR}/wf-1" ]
    assert [ -d "${CREATED_DIR}/wf-2" ]
    assert [ -d "${CREATED_DIR}/wf-3" ]
}
