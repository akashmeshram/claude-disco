# Go Project Rules

## Code Style

### Formatting
- Use gofmt / goimports
- Follow Effective Go guidelines
- Use golint / staticcheck

### Naming
```go
// Packages: lowercase, single word
package user

// Exported: PascalCase
type UserService struct {}
func NewUserService() *UserService {}

// Unexported: camelCase
type userRepository struct {}
func (s *UserService) validateEmail(email string) bool {}

// Interfaces: -er suffix for single method
type Reader interface {
    Read(p []byte) (n int, err error)
}

// Acronyms: consistent case
type HTTPClient struct {}  // not HttpClient
var userID string          // not useriD
```

### Error Handling
```go
// Return errors, don't panic
func GetUser(id string) (*User, error) {
    user, err := repo.Find(id)
    if err != nil {
        return nil, fmt.Errorf("get user %s: %w", id, err)
    }
    return user, nil
}

// Custom errors
var ErrNotFound = errors.New("not found")

type ValidationError struct {
    Field   string
    Message string
}

func (e *ValidationError) Error() string {
    return fmt.Sprintf("%s: %s", e.Field, e.Message)
}
```

## Patterns

### Dependency Injection
```go
type UserService struct {
    repo   UserRepository
    cache  Cache
    logger Logger
}

func NewUserService(repo UserRepository, cache Cache, logger Logger) *UserService {
    return &UserService{
        repo:   repo,
        cache:  cache,
        logger: logger,
    }
}
```

### Options Pattern
```go
type Option func(*Config)

func WithTimeout(d time.Duration) Option {
    return func(c *Config) {
        c.Timeout = d
    }
}

func NewClient(opts ...Option) *Client {
    cfg := defaultConfig()
    for _, opt := range opts {
        opt(&cfg)
    }
    return &Client{config: cfg}
}
```

### Context
```go
func (s *Service) GetUser(ctx context.Context, id string) (*User, error) {
    // Check for cancellation
    select {
    case <-ctx.Done():
        return nil, ctx.Err()
    default:
    }
    
    return s.repo.Find(ctx, id)
}
```

## Testing

```go
func TestUserService_Create(t *testing.T) {
    // Arrange
    repo := &mockRepo{}
    service := NewUserService(repo)
    
    // Act
    user, err := service.Create("test@example.com")
    
    // Assert
    if err != nil {
        t.Fatalf("unexpected error: %v", err)
    }
    if user.Email != "test@example.com" {
        t.Errorf("got email %q, want %q", user.Email, "test@example.com")
    }
}

// Table-driven tests
func TestValidateEmail(t *testing.T) {
    tests := []struct {
        name  string
        email string
        want  bool
    }{
        {"valid", "test@example.com", true},
        {"no at", "testexample.com", false},
        {"empty", "", false},
    }
    
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got := ValidateEmail(tt.email)
            if got != tt.want {
                t.Errorf("ValidateEmail(%q) = %v, want %v", tt.email, got, tt.want)
            }
        })
    }
}
```

## Project Structure

```
myproject/
├── cmd/
│   └── myapp/
│       └── main.go
├── internal/
│   ├── user/
│   │   ├── service.go
│   │   ├── repository.go
│   │   └── service_test.go
│   └── api/
├── pkg/
│   └── utils/
├── go.mod
├── go.sum
└── README.md
```
