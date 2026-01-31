#!/bin/bash
# On-error hook - runs when Claude encounters an error
# Receives error details via stdin as JSON
# Can provide suggestions or context

# Read error from stdin
ERROR_JSON=$(cat)

# Extract error type if available
ERROR_TYPE=$(echo "$ERROR_JSON" | jq -r '.error_type // "unknown"' 2>/dev/null || echo "unknown")
ERROR_MSG=$(echo "$ERROR_JSON" | jq -r '.message // ""' 2>/dev/null || echo "")

# Provide contextual suggestions based on error type
case "$ERROR_TYPE" in
    "build_error")
        echo "Build error detected. Consider:"
        echo "  - Check for missing dependencies: npm install / pip install -r requirements.txt"
        echo "  - Verify TypeScript types are correct"
        echo "  - Check for circular imports"
        ;;
    "test_error")
        echo "Test failure detected. Consider:"
        echo "  - Run individual failing test with verbose output"
        echo "  - Check test fixtures and mocks"
        echo "  - Verify test environment setup"
        ;;
    "lint_error")
        echo "Lint error detected. Consider:"
        echo "  - Run auto-fix: eslint --fix / ruff --fix"
        echo "  - Check .eslintrc or ruff.toml for rules"
        ;;
    *)
        # Generic suggestions
        if echo "$ERROR_MSG" | grep -qi "module not found\|cannot find module"; then
            echo "Missing module. Try: npm install / pip install"
        elif echo "$ERROR_MSG" | grep -qi "permission denied"; then
            echo "Permission issue. Check file permissions or run with appropriate access."
        fi
        ;;
esac

exit 0
