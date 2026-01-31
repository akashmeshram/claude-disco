---
name: document
description: "Generate documentation for code. Usage: /document [file|module]"
---

# Document Command

Generate documentation for code.

## Usage

```
/document                   # Document current file
/document path/to/file.py   # Document specific file
/document src/api/          # Document module/directory
/document --api             # Generate API docs
/document --readme          # Generate/update README
```

## What It Generates

| Type | Output |
|------|--------|
| Function docs | Docstrings with params, returns, examples |
| Class docs | Class description, methods, usage |
| Module docs | Overview, exports, dependencies |
| API docs | Endpoints, params, responses |
| README | Project overview, install, usage |

## Output

```
### Documentation for `user_service.py`

#### Module Overview
User management service handling CRUD operations 
and authentication.

#### Functions

##### `create_user(name: str, email: str) -> User`
Creates a new user account.

**Parameters:**
- `name` (str): User's display name
- `email` (str): User's email address

**Returns:**
- `User`: The created user object

**Raises:**
- `ValidationError`: If email is invalid
- `DuplicateError`: If email already exists

**Example:**
```python
user = create_user("John", "john@example.com")
```

#### Classes

##### `UserService`
Main service class for user operations.

**Methods:**
| Method | Description |
|--------|-------------|
| `get(id)` | Fetch user by ID |
| `update(id, data)` | Update user data |
| `delete(id)` | Soft delete user |
```

## Documentation Styles

Adapts to project conventions:
- Python: Google, NumPy, Sphinx docstrings
- JavaScript: JSDoc
- TypeScript: TSDoc
- Go: GoDoc comments
