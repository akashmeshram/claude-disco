---
name: test
description: "Generate tests for code. Usage: /test [file|function]"
---

# /test

Generate meaningful tests, not just coverage theater.

## Examples

```bash
/test src/utils.ts          # Generate tests for a file
/test parseDate             # Generate tests for a function
/test src/api/              # Generate tests for a directory
```

## What You Get

- **Unit tests** for pure functions
- **Edge cases** (null, empty, boundary values)
- **Error paths** (what happens when things fail)
- **Integration tests** when functions touch external systems

## Test Philosophy

Tests answer: "If this breaks, will the test catch it?"

Not generated:
- Tests that just verify the implementation
- Tests that require complex mocks with no value
- Tests for trivial getters/setters

## Framework Detection

Automatically uses your project's testing setup:
- JavaScript: Jest, Vitest, Mocha
- Python: pytest, unittest
- Go: testing package
- Rust: built-in test framework

## Tips

- Review generated tests - they're suggestions, not gospel
- Add your own edge cases - you know the business logic
- Delete tests that don't catch real bugs

## Cognitive Debiasing

### Test Generation Biases to Counter

| Bias | Trap | How /test Counters |
|------|------|-------------------|
| **Happy path focus** | Only testing success cases | Explicitly generates error cases |
| **Coverage theater** | High % without real verification | Tests for behavior, not lines |
| **Familiarity** | Testing what you expect to break | Systematic edge case generation |
| **Optimism** | "This can't fail" | Assumes it will fail, tests how |

## Human Factors

### Why Developers Skip Tests

- **Time pressure**: "I'll add tests later"
- **Uncertain value**: "Will this catch bugs?"
- **Mocking complexity**: External dependencies are hard
- **Maintenance burden**: Tests need updates too

### Making Testing Easier

Generated tests are:
- **Runnable immediately** - No setup required
- **Documented** - Clear what's being tested
- **Focused** - One assertion per test
- **Maintainable** - Test behavior, not implementation

## Decision Science

### Test Priority Matrix

| Code Characteristic | Test Priority | Why |
|--------------------|---------------|-----|
| Handles money/auth | CRITICAL | Failure = breach/loss |
| Complex logic | HIGH | Likely to have bugs |
| Frequently changed | HIGH | Regression risk |
| Simple/stable | MEDIUM | Less likely to break |
| Trivial getters | LOW | Cost > benefit |

### Test ROI

```
Test value = (Bug probability × Bug cost × Detection rate)
Test cost = Writing time + Maintenance time + Run time

Test when: Value > Cost
```

Generated tests prioritize high-value scenarios.
