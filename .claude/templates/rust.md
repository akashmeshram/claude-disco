# Rust Project Rules

## Code Style

### Formatting
- Use rustfmt
- Use clippy for linting
- Follow Rust API Guidelines

### Naming
```rust
// Modules: snake_case
mod user_service;

// Types/Traits: PascalCase
struct UserService;
trait Repository;
enum UserRole { Admin, User }

// Functions/variables: snake_case
fn get_user_by_id(id: &str) -> Result<User, Error>;
let user_count = 0;

// Constants: SCREAMING_SNAKE_CASE
const MAX_CONNECTIONS: usize = 100;

// Lifetimes: short lowercase
fn parse<'a>(input: &'a str) -> &'a str;
```

### Error Handling
```rust
use thiserror::Error;

#[derive(Error, Debug)]
pub enum UserError {
    #[error("user not found: {0}")]
    NotFound(String),
    
    #[error("validation failed: {0}")]
    Validation(String),
    
    #[error(transparent)]
    Database(#[from] sqlx::Error),
}

fn get_user(id: &str) -> Result<User, UserError> {
    let user = db.find(id)
        .ok_or_else(|| UserError::NotFound(id.to_string()))?;
    Ok(user)
}
```

## Patterns

### Builder Pattern
```rust
#[derive(Default)]
pub struct RequestBuilder {
    url: String,
    timeout: Option<Duration>,
    headers: HashMap<String, String>,
}

impl RequestBuilder {
    pub fn new(url: impl Into<String>) -> Self {
        Self {
            url: url.into(),
            ..Default::default()
        }
    }
    
    pub fn timeout(mut self, duration: Duration) -> Self {
        self.timeout = Some(duration);
        self
    }
    
    pub fn build(self) -> Request {
        Request { /* ... */ }
    }
}
```

### Newtype Pattern
```rust
pub struct UserId(String);

impl UserId {
    pub fn new(id: impl Into<String>) -> Result<Self, ValidationError> {
        let id = id.into();
        if id.is_empty() {
            return Err(ValidationError::Empty);
        }
        Ok(Self(id))
    }
    
    pub fn as_str(&self) -> &str {
        &self.0
    }
}
```

### Traits
```rust
pub trait Repository {
    type Entity;
    type Error;
    
    fn find(&self, id: &str) -> Result<Option<Self::Entity>, Self::Error>;
    fn save(&self, entity: &Self::Entity) -> Result<(), Self::Error>;
}
```

## Testing

```rust
#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_user_creation() {
        let user = User::new("test@example.com").unwrap();
        assert_eq!(user.email(), "test@example.com");
    }
    
    #[test]
    fn test_invalid_email_fails() {
        let result = User::new("");
        assert!(matches!(result, Err(UserError::Validation(_))));
    }
}

// Integration tests in tests/
#[tokio::test]
async fn test_user_flow() {
    let db = setup_test_db().await;
    let service = UserService::new(db);
    
    let user = service.create("test@example.com").await.unwrap();
    let found = service.find(&user.id).await.unwrap();
    
    assert_eq!(found, Some(user));
}
```

## Project Structure

```
myproject/
├── src/
│   ├── main.rs
│   ├── lib.rs
│   ├── user/
│   │   ├── mod.rs
│   │   ├── service.rs
│   │   └── repository.rs
│   └── api/
├── tests/
│   └── integration.rs
├── Cargo.toml
└── README.md
```
