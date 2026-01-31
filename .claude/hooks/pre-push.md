---
name: pre-push
trigger: before_push
description: "Checks to run before pushing to remote"
---

# Pre-Push Hook

Runs before Claude pushes to remote repository.

## Checks

### 1. Branch Protection
Prevent direct push to protected branches:
- main / master
- production
- release/*

### 2. Full Test Suite
Run complete test suite:
```bash
npm test
# or
pytest
# or
go test ./...
```

### 3. Build Verification
Ensure build succeeds:
```bash
npm run build
# or
python setup.py build
# or
go build ./...
```

### 4. No WIP Commits
Check for work-in-progress:
- "WIP" in commit messages
- "fixup!" commits
- "squash!" commits

### 5. Changelog Updated
For release branches:
- CHANGELOG.md updated
- Version bumped if needed

## Output

```
Pre-push checks (feature/auth → origin):
✓ Branch allowed
✓ Tests passed (156/156)
✓ Build successful
✓ No WIP commits
○ Changelog (skipped - not release branch)

Ready to push.
```

Or if issues:
```
Pre-push checks:
✗ Protected branch: main
  Use a feature branch and create a PR instead.

Push blocked.
```

## Configuration

In `.claude/settings.json`:
```json
{
  "hooks": {
    "pre-push": {
      "protected-branches": ["main", "master", "production"],
      "full-tests": true,
      "build-check": true,
      "no-wip": true,
      "changelog": false
    }
  }
}
```

## Force Push Warning

Extra confirmation for force push:
```
⚠️ Force push detected to origin/feature-branch
This will rewrite history. Continue? (yes/no)
```
