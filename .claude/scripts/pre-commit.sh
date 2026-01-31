#!/bin/bash
# Pre-commit hook - runs before git commit
# Exit 0 to allow, exit 2 to block with message

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0

echo "Running pre-commit checks..."

# 1. Check for secrets/credentials
echo -n "Checking for secrets... "
if git diff --cached --name-only | xargs grep -l -E "(API_KEY|SECRET|PASSWORD|PRIVATE_KEY|aws_access_key|aws_secret_key)" 2>/dev/null | grep -v ".example" | grep -v ".sample"; then
    echo -e "${RED}FAILED${NC}"
    echo "  Potential secrets found in staged files"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}OK${NC}"
fi

# 2. Check for debug statements
echo -n "Checking for debug code... "
DEBUG_FILES=$(git diff --cached --name-only | xargs grep -l -E "(console\.log|debugger|print\(.*DEBUG|pdb\.set_trace)" 2>/dev/null || true)
if [ -n "$DEBUG_FILES" ]; then
    echo -e "${YELLOW}WARNING${NC}"
    echo "  Debug code found in: $DEBUG_FILES"
    # Warning only, don't block
else
    echo -e "${GREEN}OK${NC}"
fi

# 3. Check for .env files
echo -n "Checking for .env files... "
if git diff --cached --name-only | grep -E "^\.env$|^\.env\." | grep -v ".example" | grep -v ".sample"; then
    echo -e "${RED}FAILED${NC}"
    echo "  .env files should not be committed"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}OK${NC}"
fi

# 4. Run linter if available
if command -v eslint &> /dev/null; then
    echo -n "Running ESLint... "
    JS_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(js|ts|jsx|tsx)$' || true)
    if [ -n "$JS_FILES" ]; then
        if eslint $JS_FILES --quiet 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAILED${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${GREEN}SKIP${NC} (no JS/TS files)"
    fi
fi

if command -v ruff &> /dev/null; then
    echo -n "Running Ruff... "
    PY_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.py$' || true)
    if [ -n "$PY_FILES" ]; then
        if ruff check $PY_FILES --quiet 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAILED${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${GREEN}SKIP${NC} (no Python files)"
    fi
fi

# Summary
echo ""
if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Pre-commit checks failed with $ERRORS error(s)${NC}"
    echo "Fix the issues above before committing."
    exit 2
else
    echo -e "${GREEN}All pre-commit checks passed${NC}"
    exit 0
fi
