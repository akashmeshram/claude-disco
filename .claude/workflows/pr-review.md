---
name: pr-review
description: "Comprehensive PR review workflow"
---

# Pull Request Review Workflow

Thorough, consistent PR reviews.

## Pre-Review

### Context Gathering
```
1. Read PR description
2. Understand the goal
3. Check linked issues
4. Review previous discussion
```

### Quick Checks
| Check | Status |
|-------|--------|
| Has description | [ ] |
| Linked to issue | [ ] |
| Reasonable size (< 400 lines) | [ ] |
| Has tests | [ ] |
| CI passing | [ ] |

## Code Review

### 1. Correctness
```
/review --correctness

- Does it do what it claims?
- Are there logic errors?
- Are edge cases handled?
- Could it break existing behavior?
```

### 2. Security
```
/review --security

- Input validation
- Authentication/authorization
- Data exposure risks
- Injection vulnerabilities
```

### 3. Performance
```
/review --performance

- Obvious performance issues?
- N+1 queries?
- Memory concerns?
- Unnecessary work?
```

### 4. Maintainability
```
- Is it readable?
- Is it well-structured?
- Are names clear?
- Is complexity reasonable?
```

### 5. Testing
```
- Are tests meaningful?
- Do they cover the change?
- Edge cases tested?
- Are tests maintainable?
```

## Review Checklist

### Must Check
- [ ] Correctness - Does it work?
- [ ] No security vulnerabilities
- [ ] Tests included and passing
- [ ] No breaking changes (or documented)

### Should Check
- [ ] Code is readable
- [ ] No obvious performance issues
- [ ] Error handling is appropriate
- [ ] Logging is adequate

### Nice to Check
- [ ] Follows project patterns
- [ ] Documentation updated
- [ ] No unnecessary changes

## Feedback Guidelines

### Be Constructive
```
❌ "This is wrong"
✅ "Consider using X because..."

❌ "Why did you do this?"
✅ "Could you help me understand the reasoning for...?"
```

### Categorize Feedback
```
🔴 Blocker: Must fix before merge
🟡 Suggestion: Consider but not required
💭 Question: Need clarification
💡 Nitpick: Minor style preference
```

### Provide Examples
```
Instead of this:
[current code]

Consider:
[suggested improvement]

Because:
[reasoning]
```

## Decision

### Approve When
- All blockers addressed
- Tests passing
- No security issues
- Meets project standards

### Request Changes When
- Has bugs or logic errors
- Security vulnerabilities
- Missing critical tests
- Breaking change not addressed

### Comment When
- Have questions
- Want discussion
- Minor suggestions only

## Post-Review

### After Merge
- [ ] Delete branch
- [ ] Close related issue
- [ ] Update documentation if needed
- [ ] Notify stakeholders if needed

### Follow-up
- [ ] Monitor for issues
- [ ] Check deployment
- [ ] Verify in staging/production
