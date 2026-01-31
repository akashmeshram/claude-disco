---
name: debug
description: "Systematic debugging that counters cognitive biases. Usage: /debug [description]"
---

# /debug

Systematic debugging designed to counter the biases that make bugs hard to find.

## The STOP Protocol

When you're stuck, your fast brain wants to immediately try fixes. Resist.

```
S - Stop      Don't touch the code yet
T - Think     What do we actually know?
O - Observe   Gather evidence systematically
P - Plan      One hypothesis, one test
```

## Common Debugging Biases

| Bias | How It Hurts | Counter |
|------|--------------|---------|
| **Confirmation** | Only see evidence for your theory | Actively try to disprove it |
| **Recency** | Blame the last thing changed | Check if the bug existed before |
| **Availability** | Suspect familiar failure modes | Consider unfamiliar ones too |
| **Anchoring** | First hypothesis dominates | Generate 3 hypotheses before investigating |

## The Scientific Method for Bugs

### 1. Define the Problem (not the solution)

**Bad**: "The cache is broken"
**Good**: "Users see stale data after profile updates, ~30% of the time"

### 2. Gather Evidence

- Exact error messages (copy-paste, don't paraphrase)
- Steps to reproduce
- When it started
- What changed recently
- Who/what is affected

### 3. Form Hypotheses (plural)

Generate at least 3 possible causes before investigating any:

1. [Most likely based on evidence]
2. [Second most likely]
3. [Wildcard - what if our assumptions are wrong?]

### 4. Test One Thing at a Time

```
Hypothesis → Prediction → Test → Result
     ↓
If confirmed: Fix and verify
If rejected: Next hypothesis
```

**Rule**: Change one variable per test. Multiple changes = confounded results.

### 5. Verify the Fix

- Bug no longer reproduces
- No new bugs introduced
- Add test to prevent regression

## Input Examples

**Good bug descriptions:**
```
/debug "Login fails with 'invalid token' after exactly 1 hour"
/debug "Memory grows 10MB/hour, never releases"
/debug "Works for Alice, fails for Bob, same inputs"
```

**Vague descriptions (will ask for clarification):**
```
/debug "It's broken"
/debug "Doesn't work"
/debug "Something's wrong with auth"
```

## Output Format

```
## Problem Statement
[Clear description of actual vs expected behavior]

## Evidence Gathered
| Fact | Source |
|------|--------|
| Error: "JWT expired" | server.log:1234 |
| Started: Jan 15 | git blame |
| Affects: 30% of users | metrics dashboard |

## Hypotheses (ranked by likelihood)

### H1: Token refresh failing [HIGH confidence]
- Evidence: Error mentions JWT expiration
- Test: Check refresh endpoint logs
- If true: Fix refresh logic

### H2: Clock skew between servers [MEDIUM confidence]
- Evidence: Only affects some users
- Test: Compare server times
- If true: Add clock tolerance

### H3: [WILDCARD] Token never being set [LOW confidence]
- Evidence: None yet
- Test: Add logging at token creation
- If true: Fix initial auth flow

## Recommended Next Step
[Single, specific action]
```

## Human Factors Checklist

Before declaring "fixed":
- [ ] Root cause addressed (not just symptoms)
- [ ] Fix tested in conditions similar to original failure
- [ ] No new issues introduced
- [ ] Regression test added
- [ ] Team notified (knowledge sharing)
