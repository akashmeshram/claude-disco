# Python Project Rules

## Code Style

### Formatting
- Use Black for formatting (line length 88)
- Use isort for import sorting
- Use Ruff for linting

### Imports
```python
# Standard library
import os
from pathlib import Path

# Third-party
import requests
from pydantic import BaseModel

# Local
from myapp.utils import helper
from myapp.models import User
```

### Naming
```python
# Modules: lowercase_with_underscores
my_module.py

# Classes: PascalCase
class UserService:
    pass

# Functions/variables: lowercase_with_underscores
def get_user_by_id(user_id: int) -> User:
    pass

# Constants: UPPERCASE_WITH_UNDERSCORES
MAX_RETRIES = 3
DEFAULT_TIMEOUT = 30

# Private: leading underscore
def _internal_helper():
    pass
```

### Type Hints
```python
from typing import Optional, List, Dict, Union

def process_items(
    items: List[str],
    config: Optional[Dict[str, Any]] = None,
) -> List[ProcessedItem]:
    ...
```

## Patterns

### Dataclasses
```python
from dataclasses import dataclass
from typing import Optional

@dataclass
class User:
    id: int
    name: str
    email: str
    active: bool = True
```

### Context Managers
```python
from contextlib import contextmanager

@contextmanager
def database_transaction():
    tx = db.begin()
    try:
        yield tx
        tx.commit()
    except Exception:
        tx.rollback()
        raise
```

### Error Handling
```python
class UserNotFoundError(Exception):
    """Raised when user is not found."""
    pass

def get_user(user_id: int) -> User:
    user = db.query(User).get(user_id)
    if not user:
        raise UserNotFoundError(f"User {user_id} not found")
    return user
```

## Testing

```python
import pytest
from unittest.mock import Mock, patch

class TestUserService:
    @pytest.fixture
    def service(self):
        return UserService(db=Mock())
    
    def test_creates_user(self, service):
        user = service.create("test@example.com")
        assert user.email == "test@example.com"
    
    def test_raises_on_duplicate(self, service):
        service.db.exists.return_value = True
        with pytest.raises(DuplicateError):
            service.create("existing@example.com")
```

## Project Structure

```
myproject/
├── src/
│   └── myproject/
│       ├── __init__.py
│       ├── main.py
│       ├── models/
│       ├── services/
│       └── utils/
├── tests/
│   ├── conftest.py
│   ├── unit/
│   └── integration/
├── pyproject.toml
├── README.md
└── .python-version
```
