---
name: release-prep
description: "Pre-release checklist workflow"
---

# Release Preparation Workflow

Ensure quality releases every time.

## Phase 1: Pre-Release Checks

### Code Quality
```
/report full

- [ ] All tests passing
- [ ] No critical lint errors
- [ ] No security vulnerabilities
- [ ] Performance acceptable
```

### Dependencies
```
/map-deps

- [ ] No vulnerable dependencies
- [ ] Dependencies up to date (or tracked)
- [ ] No unnecessary dependencies
- [ ] Lock file committed
```

### Documentation
```
- [ ] CHANGELOG updated
- [ ] README current
- [ ] API docs updated
- [ ] Migration guide (if breaking changes)
```

## Phase 2: Testing

### Automated Tests
```bash
# Full test suite
npm test -- --coverage

# Integration tests
npm run test:integration

# E2E tests
npm run test:e2e
```

### Manual Testing
| Feature | Tested | Notes |
|---------|--------|-------|
| Core functionality | [ ] | |
| New features | [ ] | |
| Edge cases | [ ] | |
| Error handling | [ ] | |

### Environment Testing
| Environment | Tested | Notes |
|-------------|--------|-------|
| Development | [ ] | |
| Staging | [ ] | |
| Production-like | [ ] | |

## Phase 3: Version & Changelog

### Version Bump
```bash
# Determine version type
# major: breaking changes
# minor: new features
# patch: bug fixes

npm version [major|minor|patch]
```

### Changelog Entry
```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New feature A

### Changed
- Updated behavior of B

### Fixed
- Bug in C

### Security
- Fixed vulnerability in D
```

## Phase 4: Release

### Create Release
```bash
# Tag the release
git tag -a vX.Y.Z -m "Release X.Y.Z"

# Push with tags
git push origin main --tags
```

### Deployment
```
- [ ] Deploy to staging
- [ ] Verify staging
- [ ] Deploy to production
- [ ] Verify production
```

### Announcements
```
- [ ] Update status page
- [ ] Notify users (if needed)
- [ ] Post in team channel
- [ ] Update external docs
```

## Phase 5: Post-Release

### Monitoring
```
Watch for:
- [ ] Error rates
- [ ] Performance metrics
- [ ] User feedback
- [ ] System health
```

### Rollback Plan
```
If issues detected:
1. Assess severity
2. Decide: hotfix vs rollback
3. Execute rollback if needed:
   git revert vX.Y.Z
   # or rollback deployment
```

### Documentation
```
- [ ] Close release milestone
- [ ] Archive release notes
- [ ] Update roadmap
- [ ] Schedule retrospective
```

## Checklists by Release Type

### Hotfix
- [ ] Fix identified and tested
- [ ] Minimal change scope
- [ ] Fast-tracked review
- [ ] Immediate deployment

### Regular Release
- [ ] Full pre-release checks
- [ ] Complete test suite
- [ ] Changelog updated
- [ ] Normal deployment

### Major Release
- [ ] All regular checks
- [ ] Migration guide ready
- [ ] Communication plan
- [ ] Extended monitoring
- [ ] Support team briefed
