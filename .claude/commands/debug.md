---
name: debug
description: "Systematic debugging workflow. Usage: /debug [issue-description]"
---

# Debug Command

Systematic approach to debugging issues.

## Usage

```
/debug "error message or description"
/debug --error "TypeError: cannot read property"
/debug --file path/to/file.py
/debug --trace                  # Analyze stack trace
```

## Debugging Process

### 1. Understand the Problem
- What is the expected behavior?
- What is the actual behavior?
- When did it start happening?
- Can it be reproduced?

### 2. Gather Evidence
- Error messages and stack traces
- Logs around the time of issue
- Input that triggers the problem
- Environment details

### 3. Form Hypothesis
- Based on error and code analysis
- Narrow down possible causes
- Rank by likelihood

### 4. Test Hypothesis
- Add logging/debugging
- Isolate the component
- Create minimal reproduction

### 5. Fix and Verify
- Apply minimal fix
- Verify fix works
- Check for regressions
- Add test to prevent recurrence

## Output

```
### Problem Analysis

**Symptom**: [What's happening]
**Error**: [Error message if any]
**Location**: [Where it occurs]

### Hypotheses (ranked by likelihood)

1. **[Most Likely]** Description
   - Evidence: [What supports this]
   - Test: [How to verify]
   - Fix: [Proposed solution]

2. **[Possible]** Description
   - Evidence: [What supports this]
   - Test: [How to verify]

### Investigation Steps

1. [ ] Check X at file.py:123
2. [ ] Add logging at Y
3. [ ] Test with input Z

### Recommended Fix

[Code or description of fix]

### Prevention

[How to prevent this in the future]
```

## Principles

- Reproduce before fixing
- One change at a time
- Verify with tests
- Document the root cause
