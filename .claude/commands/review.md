---
name: review
description: "Code review that catches issues before they compound. Usage: /review [file|PR-number]"
---

# /review

Code review designed to catch issues before they compound into bigger problems.

## Why Early Feedback Matters

```
Cost to fix at:
  Design:      1x
  Development: 5x
  Testing:     10x
  Production:  100x
```

Review is the cheapest place to find problems.

## Examples

```bash
/review src/auth.ts         # Review a specific file
/review 123                  # Review PR #123
/review                      # Review staged changes
```

## What Gets Checked

| Aspect | Questions | Why It Matters |
|--------|-----------|----------------|
| **Correctness** | Does it work? Edge cases? | Bugs are expensive |
| **Security** | Input validated? Auth checked? | Breaches are catastrophic |
| **Performance** | N+1 queries? Memory leaks? | Scale problems compound |
| **Maintainability** | Can someone else understand this? | You won't be here forever |
| **Error Handling** | What happens when things fail? | They will fail |

## Cognitive Debiasing in Reviews

### Biases That Affect Reviewers

| Bias | How It Shows | Counter |
|------|--------------|---------|
| **Anchoring** | First impression dominates | Read whole PR before commenting |
| **Halo effect** | Senior author = good code | Review the code, not the author |
| **Confirmation** | Looking for familiar issues | Use checklist for unfamiliar ones |
| **Social pressure** | Hesitating to critique | Focus on code, not person |

## Feedback Format

| Marker | Meaning | Action Required |
|--------|---------|-----------------|
| 🔴 **Blocker** | Must fix before merge | Yes |
| 🟡 **Suggestion** | Worth considering | No |
| 💭 **Question** | Need clarification | Depends |
| 💡 **Nitpick** | Minor preference | No |

## Structured Review Output

```
## Summary
[One sentence: overall assessment]

## Decision: APPROVE | REQUEST CHANGES | NEEDS DISCUSSION

## Blockers (must fix)
- [Issue with specific line reference]

## Suggestions (consider)
- [Improvement idea with reasoning]

## Questions (clarify)
- [What I need to understand]

## What's Good
- [Specific positive observations]
```

## Pre-Merge Checklist (Human Factors)

Before approving, verify:
- [ ] Solves the stated problem
- [ ] No obvious security vulnerabilities
- [ ] Error cases handled
- [ ] Tests cover the change
- [ ] Someone else can maintain this

## Tips for Requesters

- **Small PRs** get better reviews (< 400 lines)
- **Context helps**: Link to issue, explain the "why"
- **Self-review first**: Catch the obvious before asking others

## Tips for Reviewers

- **Assume good intent**: They tried their best
- **Be specific**: "Line 45 has SQL injection" > "Security issue"
- **Explain why**: Help them learn, not just fix
- **Pick battles**: Not every preference is worth a comment
