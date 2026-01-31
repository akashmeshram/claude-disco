---
name: review
description: "Code review a file or PR. Usage: /review [file|PR-number]"
---

# Review Command

Perform thorough code review.

## Usage

```
/review                     # Review recent changes
/review path/to/file.py     # Review specific file
/review #123                 # Review PR #123
/review --security          # Focus on security
/review --perf              # Focus on performance
```

## What It Checks

| Category | Items |
|----------|-------|
| Correctness | Logic errors, edge cases, null handling |
| Security | Injection, auth, data exposure |
| Performance | N+1 queries, memory leaks, blocking |
| Maintainability | Complexity, naming, structure |
| Style | Consistency, conventions |

## Output

```
### Code Review: `auth_service.py`

#### Summary
| Aspect | Score | Issues |
|--------|-------|--------|
| Correctness | ⚠️ | 2 |
| Security | 🔴 | 1 |
| Performance | ✅ | 0 |
| Style | ✅ | 0 |

#### Critical Issues

**🔴 SEC-1: SQL Injection (Line 45)**
```python
# Current
query = f"SELECT * FROM users WHERE id = {user_id}"

# Suggested
query = "SELECT * FROM users WHERE id = %s"
cursor.execute(query, (user_id,))
```

#### Suggestions

**💡 Consider using dataclass (Line 12-25)**
The User class could be simplified with @dataclass

#### Approved ✅
- Good error handling
- Clear naming conventions
- Proper logging
```

## Review Checklist

- [ ] No security vulnerabilities
- [ ] Error handling is complete
- [ ] Edge cases are covered
- [ ] No obvious performance issues
- [ ] Code is readable
- [ ] Tests are included
