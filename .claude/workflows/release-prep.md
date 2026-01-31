---
name: release-prep
description: "Pre-release checklist workflow"
---

# Release Preparation Workflow

Ensure quality releases every time—designed using human factors engineering to prevent release failures.

## Why Checklists Matter

```
Aviation accident rate dropped 90% after checklist adoption.
Software release failures follow similar patterns:
  Skipped step → Bug ships → Incident → Postmortem → "Use a checklist"

This workflow is that checklist.
```

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

## Cognitive Debiasing

### Release Biases to Counter

| Bias | Trap | Counter |
|------|------|---------|
| **Optimism** | "It works in staging" | Production is different |
| **Time pressure** | "Ship now, fix later" | Bugs shipped = incidents |
| **Sunk cost** | "We've already done the work" | Bad release costs more than delay |
| **Groupthink** | "Everyone thinks it's ready" | Use checklist, not consensus |

### Pre-Release Reality Check

Before release, answer honestly:
- Would you deploy this on a Friday afternoon?
- What's the worst-case if something goes wrong?
- Is the rollback plan tested?
- Does the team have capacity to respond to issues?

## Human Factors

### Why Releases Fail

| Failure | Common Cause | Prevention |
|---------|--------------|------------|
| Missing test | Skipped under pressure | Checklist enforcement |
| Bad config | Env mismatch | Environment checklist |
| Incomplete rollback | Never tested | Practice rollback regularly |
| Poor communication | Assumed others knew | Explicit notification step |

### Release Fatigue Prevention

High-stress releases lead to mistakes:
- **No Friday deploys** (unless necessary)
- **No release after long day** (tired people make errors)
- **Two-person rule** (for critical steps)
- **Post-release cool-off** (monitor before celebrating)

## Decision Science

### Release Go/No-Go Criteria

| Criteria | GO | NO-GO |
|----------|----|----|
| Tests passing | 100% | < 100% critical tests |
| Security scan | No critical/high | Any critical |
| Performance | Within baseline | Regression detected |
| Rollback tested | Yes | No |
| Team capacity | Available to respond | Skeleton crew |

### Version Decision Matrix

| Change Type | Version Bump | Communication |
|-------------|-------------|---------------|
| Bug fix only | Patch (x.x.1) | Release notes |
| New feature | Minor (x.1.0) | Announcement |
| Breaking change | Major (1.0.0) | Migration guide + notice |
