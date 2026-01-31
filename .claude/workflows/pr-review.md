---
name: pr-review
description: "Comprehensive PR review workflow"
---

# Pull Request Review Workflow

Thorough, consistent PR reviews designed to counter the cognitive biases that make reviewers miss issues.

## Why Reviews Matter

```
Cost to fix at:
  Code Review:    1x
  Testing:       10x
  Production:   100x
```

Reviews are the cheapest place to catch bugs—but bias undermines them.

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

## Cognitive Debiasing for Reviewers

### Biases That Affect Reviews

| Bias | How It Shows | Counter |
|------|--------------|---------|
| **Anchoring** | First impression dominates | Read whole PR before commenting |
| **Halo effect** | Senior author = good code | Review the code, not the author |
| **Confirmation** | Looking for familiar issues | Use checklist for unfamiliar ones |
| **Social pressure** | Hesitating to critique | Focus on code, not person |
| **LGTM fatigue** | Rubber-stamping after first few files | Take breaks on large PRs |

### Review Quality Checklist

Before approving, verify you actually checked:
- [ ] Understood the purpose (not just skimmed)
- [ ] Checked error paths, not just happy path
- [ ] Considered edge cases
- [ ] Verified tests match the change
- [ ] Asked clarifying questions when unsure

## Human Factors

### Why Large PRs Get Poor Reviews

```
PR Size → Review Quality (inverse correlation)

< 200 lines: Thorough review
200-400 lines: Good review
400-800 lines: Declining attention
> 800 lines: "LGTM" (barely read)
```

**Ask authors to split large PRs.**

### Feedback That Helps

| Instead of... | Try... |
|---------------|--------|
| "This is wrong" | "This might cause X when Y happens" |
| "Why did you...?" | "Help me understand the reasoning for..." |
| "You should..." | "Consider... because..." |
| "Obviously..." | (Nothing is obvious to everyone) |

### Review Fatigue Prevention

- Review max 400 lines per session
- Take 5-minute breaks between PRs
- Review hardest code when freshest (morning)
- Explicitly state your confidence: "I haven't reviewed the auth changes deeply"
