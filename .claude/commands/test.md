---
name: test
description: "Generate tests for code. Usage: /test [file|function]"
---

# Test Command

Generate comprehensive tests for code.

## Usage

```
/test                       # Analyze and suggest tests
/test path/to/file.py       # Generate tests for file
/test MyClass.method        # Generate tests for specific method
/test --coverage            # Focus on uncovered code
```

## Process

1. Analyze the code structure
2. Identify testable units
3. Determine test cases needed
4. Generate test code
5. Show coverage improvement

## Test Cases Generated

| Category | Examples |
|----------|----------|
| Happy path | Normal input, expected output |
| Edge cases | Empty, null, boundary values |
| Error cases | Invalid input, exceptions |
| Integration | Component interactions |

## Output

```
### Test Plan for `user_service.py`

#### Functions to Test
| Function | Cases | Priority |
|----------|-------|----------|
| create_user | 5 | High |
| validate_email | 4 | High |
| get_user | 3 | Medium |

### Generated Tests

```python
import pytest
from user_service import create_user, validate_email

class TestCreateUser:
    def test_creates_user_with_valid_data(self):
        ...
    
    def test_raises_on_duplicate_email(self):
        ...
    
    def test_handles_empty_name(self):
        ...
```

### Coverage Impact
Before: 65%
After: 82% (+17%)
```

## Test Frameworks

Detects and uses project's test framework:
- Python: pytest, unittest
- JavaScript: jest, vitest, mocha
- Go: testing
- Rust: built-in
