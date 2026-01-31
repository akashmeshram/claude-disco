---
name: refactor
description: "Suggest and apply refactoring. Usage: /refactor [file|pattern]"
---

# Refactor Command

Identify and apply safe refactoring.

## Usage

```
/refactor                   # Analyze for refactoring opportunities
/refactor path/to/file.py   # Refactor specific file
/refactor --smell duplication  # Find specific smell
/refactor --apply           # Apply suggested refactoring
```

## Refactoring Types

| Type | Description |
|------|-------------|
| Extract Method | Break up long functions |
| Extract Class | Split god objects |
| Rename | Improve naming |
| Move | Better organization |
| Inline | Remove unnecessary indirection |
| Simplify | Reduce complexity |

## Output

```
### Refactoring Analysis: `order_service.py`

#### Opportunities Found: 5

##### 1. Extract Method (High Value)
**Location:** Lines 45-89
**Smell:** Long method (44 lines)
**Suggestion:** Extract validation logic

```python
# Before
def process_order(self, order):
    # 44 lines of mixed concerns
    
# After
def process_order(self, order):
    self._validate_order(order)
    self._calculate_totals(order)
    self._apply_discounts(order)
    return self._save_order(order)
```

##### 2. Remove Duplication (Medium Value)
**Location:** Lines 120, 156, 192
**Smell:** Same null check repeated 3 times
**Suggestion:** Extract to helper

Apply refactoring #1? (y/n)
```

## Safety

- Always show before/after diff
- Require test pass after each change
- One refactoring at a time
- Easy rollback with git

## Cognitive Debiasing

### Refactoring Biases to Counter

| Bias | Trap | How /refactor Counters |
|------|------|------------------------|
| **Shiny object** | Refactoring interesting code | Prioritizes by impact, not interest |
| **Perfectionism** | "While I'm here..." | Scope enforcement, one change at a time |
| **Overconfidence** | "This is obviously safe" | Requires tests, shows diffs |
| **Familiarity** | Refactoring code you know | Systematic analysis, not intuition |

## Human Factors

### Why Refactoring Feels Risky

- **No visible progress**: No new features shipped
- **Break things**: Working code might stop working
- **Scope creep**: "Just one more change..."
- **Review burden**: PRs that change many files

### Making Refactoring Safe

This command enforces safe practices:
1. **Small steps**: One refactoring at a time
2. **Test verification**: Tests must pass after each step
3. **Explicit diffs**: See exactly what changes
4. **Easy rollback**: Git makes reverting trivial

## Decision Science

### When to Refactor

Refactor when cost of not refactoring > cost of refactoring:

```
Cost of keeping = (Confusion × Read frequency) + (Bug risk × Bug cost)
Cost of refactoring = Engineering time + Review time + Risk of bugs
```

This command helps estimate both sides.
