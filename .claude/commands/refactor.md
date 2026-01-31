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
