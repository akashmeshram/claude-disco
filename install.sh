#!/bin/bash

# Claude Code Config Installer
# Usage: ./install.sh /path/to/project

set -e

TARGET="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$TARGET" = "." ]; then
    echo "Usage: ./install.sh /path/to/your/project"
    echo ""
    echo "This will copy .claude/ to your project directory."
    exit 1
fi

# Expand path
TARGET="$(cd "$TARGET" 2>/dev/null && pwd || echo "$TARGET")"

if [ ! -d "$TARGET" ]; then
    echo "Error: Directory '$TARGET' does not exist"
    exit 1
fi

# Check if .claude already exists
if [ -d "$TARGET/.claude" ]; then
    echo "Warning: $TARGET/.claude already exists"
    read -p "Overwrite? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
    rm -rf "$TARGET/.claude"
fi

# Copy .claude directory
cp -r "$SCRIPT_DIR/.claude" "$TARGET/"

echo "✓ Installed Claude config to $TARGET/.claude"
echo ""
echo "Contents:"
echo "  - 17 agents (analysis, security, testing, docs, migration, refactoring)"
echo "  - 11 skills"
echo "  - 15 commands"
echo "  - 5 workflows (onboarding, PR review, release, incident, tech debt)"
echo "  - 5 templates (Python, TypeScript, Go, Rust, React)"
echo "  - 4 hooks (pre-commit, post-edit, pre-push, on-error)"
echo "  - 5 prompts (explain, rubber-duck, devil's advocate, senior, security)"
echo "  - 1 rules file"
echo ""
echo "Try: /analyze, /report, /review, or /debug"
