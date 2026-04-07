#!/usr/bin/env bats
# Tests for clawflows import command

load '../test_helper'

setup() {
    setup_test_environment
}

teardown() {
    teardown_test_environment
}

# Helper: create a mock curl that serves a local file
_mock_curl_with_file() {
    local source_file="$1"
    mkdir -p "${TEST_TMPDIR}/bin"
    # Parse curl args to find the -o output path
    cat > "${TEST_TMPDIR}/bin/curl" << MOCKEOF
#!/bin/bash
outfile=""
prev=""
for arg in "\$@"; do
    if [ "\$prev" = "-o" ]; then
        outfile="\$arg"
        break
    fi
    prev="\$arg"
done
if [ -n "\$outfile" ]; then
    cp "$source_file" "\$outfile"
    exit 0
else
    cat "$source_file"
    exit 0
fi
MOCKEOF
    chmod +x "${TEST_TMPDIR}/bin/curl"
    export PATH="${TEST_TMPDIR}/bin:${PATH}"
}

# Helper: create a mock curl that fails
_mock_curl_fail() {
    mkdir -p "${TEST_TMPDIR}/bin"
    cat > "${TEST_TMPDIR}/bin/curl" << 'MOCKEOF'
#!/bin/bash
exit 22
MOCKEOF
    chmod +x "${TEST_TMPDIR}/bin/curl"
    export PATH="${TEST_TMPDIR}/bin:${PATH}"
}

# Helper: create a test WORKFLOW.md file
_create_test_wf_file() {
    local dest="$1" name="$2" emoji="${3:-}" desc="${4:-}"
    cat > "$dest" << EOF
---
name: $name${emoji:+
emoji: $emoji}${desc:+
description: $desc}
---

# $name

Test content.
EOF
}

# ============================================================================
# URL Validation
# ============================================================================

@test "import: requires a URL argument" {
    run_clawflows import
    assert_failure
    assert_output --partial "usage: clawflows import"
}

@test "import: rejects non-HTTPS URLs" {
    run_clawflows import "http://example.com/WORKFLOW.md"
    assert_failure
    assert_output --partial "only HTTPS URLs are supported"
}

@test "import: rejects non-URL strings" {
    run_clawflows import "not-a-url"
    assert_failure
    assert_output --partial "invalid URL"
}

@test "import: rejects download failure" {
    _mock_curl_fail
    run_clawflows import "https://example.com/WORKFLOW.md"
    assert_failure
    assert_output --partial "failed to download"
}

# ============================================================================
# Frontmatter Validation
# ============================================================================

@test "import: rejects file without name field" {
    local wf_file="${TEST_TMPDIR}/bad.md"
    cat > "$wf_file" << 'EOF'
---
emoji: x
description: Missing name
---
EOF
    _mock_curl_with_file "$wf_file"

    run_clawflows import "https://example.com/WORKFLOW.md"
    assert_failure
    assert_output --partial "missing required 'name' field"
}

@test "import: rejects file without description field" {
    local wf_file="${TEST_TMPDIR}/bad.md"
    cat > "$wf_file" << 'EOF'
---
name: no-desc
emoji: x
---
EOF
    _mock_curl_with_file "$wf_file"

    run_clawflows import "https://example.com/WORKFLOW.md"
    assert_failure
    assert_output --partial "missing required 'description' field"
}

# ============================================================================
# Security Warning
# ============================================================================

@test "import: shows security warning with source URL" {
    local wf_file="${TEST_TMPDIR}/good.md"
    _create_test_wf_file "$wf_file" "warn-wf" "x" "A workflow"
    _mock_curl_with_file "$wf_file"

    # Pipe "n" to decline save
    output="$(echo "n" | "$TEST_CLI" import "https://example.com/WORKFLOW.md" 2>&1)"
    status=$?

    [ "$status" -eq 0 ]
    echo "$output" | grep -q "Downloaded from:"
    echo "$output" | grep -q "Review workflows before enabling"
    echo "$output" | grep -q "Cancelled"
    # Should NOT have saved
    [ ! -d "${CREATED_DIR}/warn-wf" ]
}

# ============================================================================
# Import to Custom Directory
# ============================================================================

@test "import: saves workflow to created directory" {
    local wf_file="${TEST_TMPDIR}/good.md"
    _create_test_wf_file "$wf_file" "imported-wf" "x" "An imported workflow"
    _mock_curl_with_file "$wf_file"
    mock_openclaw "missing"

    # Pipe "y" to save, "n" to decline enable
    output="$(printf 'y\nn\n' | "$TEST_CLI" import "https://example.com/WORKFLOW.md" 2>&1)"
    status=$?

    [ "$status" -eq 0 ]
    echo "$output" | grep -q "Saved to created/imported-wf"
    [ -f "${CREATED_DIR}/imported-wf/WORKFLOW.md" ]
    grep -q "name: imported-wf" "${CREATED_DIR}/imported-wf/WORKFLOW.md"
}

@test "import: enables workflow when user accepts" {
    local wf_file="${TEST_TMPDIR}/good.md"
    _create_test_wf_file "$wf_file" "auto-enable-wf" "x" "Will be auto-enabled"
    _mock_curl_with_file "$wf_file"
    mock_openclaw "missing"

    # Pipe "y" to save, empty line for enable (default Y)
    output="$(printf 'y\n\n' | "$TEST_CLI" import "https://example.com/WORKFLOW.md" 2>&1)"
    status=$?

    [ "$status" -eq 0 ]
    echo "$output" | grep -q "auto-enable-wf enabled"
    [ -L "${ENABLED_DIR}/auto-enable-wf" ]
}

# ============================================================================
# Conflict Detection
# ============================================================================

@test "import: detects existing custom workflow conflict" {
    create_custom_workflow "conflict-wf" "x" "Existing workflow"

    local wf_file="${TEST_TMPDIR}/conflict.md"
    _create_test_wf_file "$wf_file" "conflict-wf" "x" "New version"
    _mock_curl_with_file "$wf_file"

    # Pipe "y" to save, "n" to decline overwrite
    output="$(printf 'y\nn\n' | "$TEST_CLI" import "https://example.com/WORKFLOW.md" 2>&1)"
    status=$?

    [ "$status" -eq 0 ]
    echo "$output" | grep -q "already exists"
    echo "$output" | grep -q "Cancelled"
}

@test "import: overwrites when user confirms" {
    create_custom_workflow "overwrite-wf" "x" "Old version"

    local wf_file="${TEST_TMPDIR}/new.md"
    _create_test_wf_file "$wf_file" "overwrite-wf" "x" "New version"
    _mock_curl_with_file "$wf_file"
    mock_openclaw "missing"

    # Pipe "y" to save, "y" to overwrite, "n" to decline enable
    output="$(printf 'y\ny\nn\n' | "$TEST_CLI" import "https://example.com/WORKFLOW.md" 2>&1)"
    status=$?

    [ "$status" -eq 0 ]
    echo "$output" | grep -q "Saved to created/overwrite-wf"
    grep -q "New version" "${CREATED_DIR}/overwrite-wf/WORKFLOW.md"
}

