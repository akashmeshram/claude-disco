#!/bin/bash
# Post-edit hook - runs after file edits
# Receives file path as $1
# Exit 0 to continue, non-zero to report issues

FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
    exit 0
fi

# Get file extension
EXT="${FILE_PATH##*.}"

# Auto-format based on file type (if formatters available)
case "$EXT" in
    js|jsx|ts|tsx|json|css|scss|md)
        if command -v prettier &> /dev/null; then
            prettier --write "$FILE_PATH" 2>/dev/null || true
        fi
        ;;
    py)
        if command -v black &> /dev/null; then
            black --quiet "$FILE_PATH" 2>/dev/null || true
        fi
        if command -v ruff &> /dev/null; then
            ruff check --fix --quiet "$FILE_PATH" 2>/dev/null || true
        fi
        ;;
    go)
        if command -v gofmt &> /dev/null; then
            gofmt -w "$FILE_PATH" 2>/dev/null || true
        fi
        ;;
    rs)
        if command -v rustfmt &> /dev/null; then
            rustfmt "$FILE_PATH" 2>/dev/null || true
        fi
        ;;
esac

exit 0
