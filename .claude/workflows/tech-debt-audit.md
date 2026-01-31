---
name: tech-debt-audit
description: "Quarterly technical debt review workflow"
---

# Technical Debt Audit Workflow

Periodic assessment of codebase health—designed using decision science to prioritize objectively and communicate effectively.

## Why Regular Audits Matter

```
Technical debt compounds like financial debt:
  Small issues ignored → Medium problems tolerated → Large crises demanded

Regular audits catch debt before it becomes critical.
```

## Cognitive Debiasing

### Audit Biases to Counter

| Bias | Trap | Counter |
|------|------|---------|
| **Recency** | Recent issues seem worst | Score against consistent criteria |
| **Availability** | Flagging memorable issues | Use systematic checklist |
| **Anchoring** | First audit section dominates | Review all before prioritizing |
| **Sunk cost** | "We already invested in this" | Evaluate current state only |
| **Normalization** | "It's always been like this" | Compare to industry standards |

## Phase 1: Automated Analysis

### Run Full Suite
```
/report full
```

### Specific Checks
```
/find-dead                  # Dead code
/map-deps                   # Dependency issues
/check-perf                 # Performance concerns
/check-errors               # Error handling gaps
```

### Collect Metrics
- Lines of code
- Test coverage percentage
- Dependency count
- Cyclomatic complexity (avg/max)
- Code duplication percentage

## Phase 2: Categorize Debt

### Code Quality Debt
| Issue | Location | Impact | Effort | Priority |
|-------|----------|--------|--------|----------|
| Dead code | [files] | Low | Low | Medium |
| Duplication | [files] | Medium | Medium | Medium |
| Complexity | [files] | High | High | High |

### Architecture Debt
| Issue | Location | Impact | Effort | Priority |
|-------|----------|--------|--------|----------|
| Circular deps | [modules] | High | High | High |
| God objects | [files] | Medium | High | Medium |
| Layer violations | [modules] | Medium | Medium | Medium |

### Testing Debt
| Issue | Location | Impact | Effort | Priority |
|-------|----------|--------|--------|----------|
| Low coverage | [modules] | High | Medium | High |
| Flaky tests | [tests] | Medium | Low | High |
| Missing integration | [features] | High | High | Medium |

### Documentation Debt
| Issue | Location | Impact | Effort | Priority |
|-------|----------|--------|--------|----------|
| Outdated README | README.md | Medium | Low | High |
| Missing API docs | [endpoints] | High | Medium | Medium |
| Stale comments | [files] | Low | Low | Low |

### Dependency Debt
| Issue | Package | Impact | Effort | Priority |
|-------|---------|--------|--------|----------|
| Outdated | [package] | High | Low | High |
| Deprecated | [package] | High | Medium | High |
| Security vuln | [package] | Critical | Low | Critical |

## Phase 3: Prioritize

### Priority Matrix

```
         │ Low Effort │ High Effort │
─────────┼────────────┼─────────────┤
High     │ DO NOW     │ PLAN        │
Impact   │            │             │
─────────┼────────────┼─────────────┤
Low      │ QUICK WINS │ BACKLOG     │
Impact   │            │             │
```

### Scoring
- **Impact**: 1-5 (5 = critical)
- **Effort**: 1-5 (5 = months)
- **Risk**: 1-5 (5 = high risk if not addressed)

**Priority Score** = (Impact × 2 + Risk) / Effort

## Phase 4: Create Plan

### Immediate (This Sprint)
1. [ ] [Critical security updates]
2. [ ] [High-impact quick wins]

### Short-term (This Quarter)
1. [ ] [Planned high-impact items]
2. [ ] [Architecture improvements]

### Long-term (Next Quarter+)
1. [ ] [Major refactoring]
2. [ ] [Infrastructure changes]

### Ongoing
- [ ] Update dependencies monthly
- [ ] Address new debt as created
- [ ] Maintain test coverage

## Phase 5: Track Progress

### Debt Burndown
| Quarter | Code Debt | Arch Debt | Test Debt | Total |
|---------|-----------|-----------|-----------|-------|
| Q1 2024 | 45 items  | 12 items  | 8 items   | 65    |
| Q2 2024 | 38 items  | 10 items  | 5 items   | 53    |

### Metrics Trend
| Metric | Last | Current | Target |
|--------|------|---------|--------|
| Coverage | 65% | 72% | 80% |
| Complexity | 15 | 12 | < 10 |
| Duplication | 8% | 5% | < 3% |

## Phase 6: Report

### Executive Summary
```markdown
## Tech Debt Status: [Good/Warning/Critical]

### Key Metrics
- Overall health score: X/100
- Critical issues: N
- Debt trend: Improving/Stable/Worsening

### Top Priorities
1. [Item] - [Why urgent]
2. [Item] - [Why urgent]

### Resource Request
- [Time/people needed]
- [Expected outcome]
```

### Recommendations
1. Allocate X% of sprint capacity to debt
2. Address critical security issues immediately
3. Schedule major refactoring for [date]

## Human Factors

### Why Debt Audits Fail

| Failure | Cause | Prevention |
|---------|-------|------------|
| Ignored report | Too long, no priorities | Executive summary first |
| No action | No ownership | Assign owners to each item |
| Audit fatigue | Quarterly burden | Automate metrics collection |
| Blame culture | Debt = failure | Debt is normal, ignoring it isn't |

### Communication for Different Audiences

| Audience | What They Care About |
|----------|---------------------|
| **Executives** | Risk, cost, decision needed |
| **Tech leads** | Priorities, owners, timeline |
| **Engineers** | Specifics, locations, how to fix |

### Making Debt Visible

Debt that isn't visible doesn't get fixed:
- Dashboard showing debt metrics
- Debt items in sprint backlog
- Regular (brief) status updates
- Celebrate debt reduction

## Decision Science

### Objective Prioritization

Avoid subjective "feels important." Use scoring:

```
Priority Score = (Impact × 2 + Risk × 1.5) / (Effort + 1)

Where:
- Impact: 1-5 (business/developer impact)
- Risk: 1-5 (consequences of not fixing)
- Effort: 1-5 (days/weeks to fix)
```

### Debt Budget Allocation

Research suggests sustainable debt allocation:
- 15-20% of engineering time on debt reduction
- Higher when debt is critical
- Lower when shipping is critical

### When to Declare "Debt Bankruptcy"

Sometimes rewriting is cheaper than paying off debt:
- Debt fixes would touch most of the codebase
- No one understands the code anymore
- Tests don't exist to verify fixes
- Business requirements have changed fundamentally

This is a major decision requiring stakeholder alignment.
