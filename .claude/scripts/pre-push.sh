#!/bin/bash
# Pre-push hook - runs before git push
# Exit 0 to allow, exit 2 to block with message

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

ERRORS=0

echo "Running pre-push checks..."

# 1. Ensure we're not pushing to main/master directly
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo -n "Checking branch... "
if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
    echo -e "${YELLOW}WARNING${NC}"
    echo "  Pushing directly to $BRANCH. Consider using a feature branch."
else
    echo -e "${GREEN}OK${NC} ($BRANCH)"
fi

# 2. Check for WIP commits
echo -n "Checking for WIP commits... "
if git log @{u}..HEAD --oneline 2>/dev/null | grep -i "WIP\|fixup\|squash"; then
    echo -e "${YELLOW}WARNING${NC}"
    echo "  WIP/fixup commits found. Consider squashing before push."
else
    echo -e "${GREEN}OK${NC}"
fi

# 3. Run tests if available
if [ -f "package.json" ] && grep -q '"test"' package.json; then
    echo -n "Running tests... "
    if npm test --silent 2>/dev/null; then
        echo -e "${GREEN}OK${NC}"
    else
        echo -e "${RED}FAILED${NC}"
        ERRORS=$((ERRORS + 1))
    fi
elif [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    if command -v pytest &> /dev/null; then
        echo -n "Running pytest... "
        if pytest --tb=no -q 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAILED${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    fi
elif [ -f "go.mod" ]; then
    echo -n "Running go test... "
    if go test ./... -short 2>/dev/null; then
        echo -e "${GREEN}OK${NC}"
    else
        echo -e "${RED}FAILED${NC}"
        ERRORS=$((ERRORS + 1))
    fi
fi

# 4. Check for large files in commits being pushed
echo -n "Checking for large files... "
LARGE_FILES=$(git diff --name-only @{u}..HEAD 2>/dev/null | xargs -I {} sh -c 'test -f "{}" && du -k "{}" | awk "\$1 > 1024 {print \$2}"' 2>/dev/null || true)
if [ -n "$LARGE_FILES" ]; then
    echo -e "${YELLOW}WARNING${NC}"
    echo "  Large files (>1MB): $LARGE_FILES"
else
    echo -e "${GREEN}OK${NC}"
fi

# Summary
echo ""
if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Pre-push checks failed with $ERRORS error(s)${NC}"
    exit 2
else
    echo -e "${GREEN}All pre-push checks passed${NC}"
    exit 0
fi
