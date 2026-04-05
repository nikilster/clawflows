#!/usr/bin/env bats
# Tests for the list command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# ============================================================================
# Basic List Tests
# ============================================================================

@test "list: shows enabled workflows" {
    create_installed_workflow "workflow-a" "🅰️" "Workflow A"
    create_installed_workflow "workflow-b" "🅱️" "Workflow B"
    enable_workflow "workflow-a"

    run_clawflows list

    assert_success
    assert_output --partial "Enabled (1)"
    assert_output --partial "workflow-a"
}

@test "list: shows available workflows" {
    create_installed_workflow "workflow-a" "🅰️" "Workflow A"
    create_installed_workflow "workflow-b" "🅱️" "Workflow B"
    enable_workflow "workflow-a"

    run_clawflows list

    assert_success
    assert_output --partial "Available (1)"
    assert_output --partial "workflow-b"
}

@test "list enabled: only shows enabled workflows" {
    create_installed_workflow "workflow-a" "🅰️" "Workflow A"
    create_installed_workflow "workflow-b" "🅱️" "Workflow B"
    enable_workflow "workflow-a"

    run_clawflows list enabled

    assert_success
    assert_output --partial "Enabled (1)"
    assert_output --partial "workflow-a"
    refute_output --partial "workflow-b"
}

@test "list available: only shows available workflows" {
    create_installed_workflow "workflow-a" "🅰️" "Workflow A"
    create_installed_workflow "workflow-b" "🅱️" "Workflow B"
    enable_workflow "workflow-a"

    run_clawflows list available

    assert_success
    assert_output --partial "Available (1)"
    assert_output --partial "workflow-b"
    refute_output --partial "Enabled"
}

@test "list: shows 'no workflows enabled' when none enabled" {
    create_installed_workflow "workflow-a" "🅰️" "Workflow A"

    run_clawflows list enabled

    assert_success
    assert_output --partial "No workflows enabled"
}

@test "list: with empty directories shows 'no workflows'" {
    run_clawflows list

    assert_success
    assert_output --partial "No workflows found"
}

# ============================================================================
# Display Tests
# ============================================================================

@test "list: shows emoji and description" {
    create_installed_workflow "test-workflow" "🧪" "A test workflow description"
    enable_workflow "test-workflow"

    run_clawflows list

    assert_success
    assert_output --partial "🧪"
    assert_output --partial "test-workflow"
}

@test "list: skips .gitkeep files" {
    create_installed_workflow "real-workflow" "🧪" "Real workflow"
    touch "${CUSTOM_DIR}/.gitkeep"

    run_clawflows list

    assert_success
    assert_output --partial "real-workflow"
    refute_output --partial ".gitkeep"
}

@test "list: custom workflows override installed by name" {
    create_installed_workflow "shared-name" "🌍" "Installed version"
    create_custom_workflow "shared-name" "🏠" "Custom version"

    run_clawflows list

    assert_success
    # Should show custom source, not @testuser (installed)
    assert_output --partial "shared-name"
    assert_output --partial "custom"
    refute_output --partial "@testuser"
}

# ============================================================================
# Count Tests
# ============================================================================

@test "list: counts enabled correctly" {
    create_installed_workflow "wf-1" "1️⃣" "First"
    create_installed_workflow "wf-2" "2️⃣" "Second"
    create_installed_workflow "wf-3" "3️⃣" "Third"
    enable_workflow "wf-1"
    enable_workflow "wf-2"

    run_clawflows list

    assert_success
    assert_output --partial "Enabled (2)"
    assert_output --partial "Available (1)"
}

@test "list: all filter shows everything" {
    create_installed_workflow "wf-enabled" "✅" "Enabled one"
    create_installed_workflow "wf-available" "📦" "Available one"
    enable_workflow "wf-enabled"

    run_clawflows list all

    assert_success
    assert_output --partial "Enabled (1)"
    assert_output --partial "Available (1)"
}

# ============================================================================
# Source Label Tests
# ============================================================================

@test "list: custom workflows show 'custom' source" {
    create_custom_workflow "my-workflow" "🏠" "My custom workflow"

    run_clawflows list

    assert_success
    assert_output --partial "my-workflow"
    assert_output --partial "custom"
}

@test "list: installed workflows show @username source" {
    create_installed_workflow "their-workflow" "🌍" "Installed workflow" "" "" "someuser"

    run_clawflows list

    assert_success
    assert_output --partial "their-workflow"
    assert_output --partial "@someuser"
}

@test "list: enabled custom workflow shows in Enabled section" {
    create_custom_workflow "my-workflow" "🏠" "My custom workflow"
    enable_workflow "my-workflow"

    run_clawflows list

    assert_success
    assert_output --partial "Enabled (1)"
    assert_output --partial "my-workflow"
}

@test "list: mix of custom and installed workflows" {
    create_custom_workflow "custom-on" "🏠" "Custom enabled"
    create_custom_workflow "custom-off" "🏡" "Custom available"
    create_installed_workflow "inst-on" "🌍" "Installed enabled"
    create_installed_workflow "inst-off" "🌎" "Installed available"
    enable_workflow "custom-on"
    enable_workflow "inst-on"

    run_clawflows list

    assert_success
    assert_output --partial "Enabled (2)"
    assert_output --partial "Available (2)"
}

@test "list: filter enabled with custom and installed" {
    create_custom_workflow "custom-on" "🏠" "Custom enabled"
    create_custom_workflow "custom-off" "🏡" "Custom available"
    create_installed_workflow "inst-on" "🌍" "Installed enabled"
    enable_workflow "custom-on"
    enable_workflow "inst-on"

    run_clawflows list enabled

    assert_success
    assert_output --partial "Enabled (2)"
    refute_output --partial "Available"
}

@test "list: filter available with custom and installed" {
    create_custom_workflow "custom-on" "🏠" "Custom enabled"
    create_installed_workflow "inst-off" "🌎" "Installed available"
    enable_workflow "custom-on"

    run_clawflows list available

    assert_success
    assert_output --partial "Available (1)"
    refute_output --partial "Enabled"
}
