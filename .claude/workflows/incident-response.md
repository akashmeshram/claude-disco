---
name: incident-response
description: "Debug production issues workflow"
---

# Incident Response Workflow

Systematic approach to production issues.

## Phase 1: Assess (First 5 minutes)

### Identify Impact
| Question | Answer |
|----------|--------|
| What's broken? | |
| Who's affected? | |
| How severe? | |
| When did it start? | |

### Severity Levels
| Level | Description | Response |
|-------|-------------|----------|
| P1 | Service down | All hands |
| P2 | Major feature broken | Primary oncall |
| P3 | Minor issue | Normal priority |

### Quick Checks
```bash
# Service health
curl -I https://api.example.com/health

# Recent deployments
git log --oneline -10

# Error logs
tail -100 /var/log/app/error.log
```

## Phase 2: Communicate

### Status Updates
```
Template:
[TIME] [STATUS] [IMPACT] [ACTION]

Example:
14:32 UTC | Investigating | API errors for 10% of users | Checking logs
```

### Notify
- [ ] Status page updated
- [ ] Team channel notified
- [ ] Stakeholders informed
- [ ] Support team briefed

## Phase 3: Investigate

### Gather Evidence
```
/debug --production

- Error logs
- Stack traces
- Metrics/graphs
- Recent changes
```

### Timeline
| Time | Event |
|------|-------|
| T-30m | Last successful deploy |
| T-10m | Error rate increased |
| T-0 | Alert triggered |

### Hypotheses
```
1. [Most likely] Description
   Evidence: [what supports this]
   Test: [how to verify]

2. [Possible] Description
   Evidence: [what supports this]
   Test: [how to verify]
```

## Phase 4: Mitigate

### Quick Fixes
| Option | Time | Risk | Impact |
|--------|------|------|--------|
| Rollback | 5m | Low | Full |
| Feature flag | 2m | Low | Partial |
| Scale up | 10m | Low | Partial |
| Hotfix | 30m+ | Medium | Full |

### Decision Tree
```
Is it a recent deploy?
├─ Yes → Rollback
└─ No → Is it load related?
        ├─ Yes → Scale up
        └─ No → Investigate deeper
```

### Execute Fix
```bash
# Rollback example
git revert HEAD
git push origin main
# or
kubectl rollout undo deployment/api
```

## Phase 5: Verify

### Confirm Fix
- [ ] Error rate back to normal
- [ ] Service responding correctly
- [ ] Users can complete flows
- [ ] Monitoring shows green

### Test
```bash
# Health check
curl https://api.example.com/health

# Functional test
curl https://api.example.com/api/test

# Load test (if applicable)
```

## Phase 6: Wrap Up

### Status Update
```
[TIME] Resolved | [CAUSE] | [DURATION] | [IMPACT]

Example:
15:15 UTC | Resolved | Database connection limit | 43 minutes | 500 errors for 15% of users
```

### Documentation
```
## Incident Report: [Title]

### Summary
- Duration: X minutes
- Impact: Y users affected
- Root cause: Z

### Timeline
[Detailed timeline]

### Root Cause
[Technical explanation]

### Resolution
[What fixed it]

### Action Items
- [ ] Prevent recurrence: [task]
- [ ] Improve detection: [task]
- [ ] Update runbook: [task]
```

### Follow-up
- [ ] Create follow-up tickets
- [ ] Schedule postmortem
- [ ] Update runbooks
- [ ] Improve monitoring
