# TypeScript Project Rules

## Code Style

### Formatting
- Use Prettier for formatting
- Use ESLint for linting
- Prefer const over let

### Imports
```typescript
// External dependencies first
import { useState, useEffect } from 'react';
import axios from 'axios';

// Internal modules
import { UserService } from '@/services/user';
import { User } from '@/types';
import { formatDate } from '@/utils';
```

### Naming
```typescript
// Interfaces: PascalCase, no I prefix
interface User {
  id: string;
  name: string;
}

// Types: PascalCase
type UserRole = 'admin' | 'user' | 'guest';

// Functions: camelCase
function getUserById(id: string): Promise<User> {}

// Constants: SCREAMING_SNAKE_CASE
const MAX_RETRIES = 3;

// Booleans: is/has/should prefix
const isLoading = true;
const hasPermission = false;
```

### Types

```typescript
// Prefer interfaces for objects
interface User {
  id: string;
  name: string;
  email: string;
}

// Use type for unions/intersections
type Result<T> = Success<T> | Error;

// Avoid any - use unknown
function parse(data: unknown): User {
  // validate and parse
}

// Use readonly for immutability
interface Config {
  readonly apiUrl: string;
  readonly timeout: number;
}
```

## Patterns

### Async/Await
```typescript
async function fetchUser(id: string): Promise<User> {
  try {
    const response = await api.get(`/users/${id}`);
    return response.data;
  } catch (error) {
    if (error instanceof NotFoundError) {
      throw new UserNotFoundError(id);
    }
    throw error;
  }
}
```

### Error Handling
```typescript
class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public statusCode: number = 500
  ) {
    super(message);
    this.name = 'AppError';
  }
}

class NotFoundError extends AppError {
  constructor(resource: string, id: string) {
    super(`${resource} ${id} not found`, 'NOT_FOUND', 404);
  }
}
```

### Generics
```typescript
interface Repository<T> {
  find(id: string): Promise<T | null>;
  findAll(): Promise<T[]>;
  save(entity: T): Promise<T>;
  delete(id: string): Promise<void>;
}

class UserRepository implements Repository<User> {
  // implementation
}
```

## Testing

```typescript
import { describe, it, expect, vi } from 'vitest';
import { UserService } from './user-service';

describe('UserService', () => {
  it('creates a user', async () => {
    const repo = { save: vi.fn().mockResolvedValue({ id: '1' }) };
    const service = new UserService(repo);
    
    const user = await service.create({ name: 'Test' });
    
    expect(user.id).toBe('1');
    expect(repo.save).toHaveBeenCalledOnce();
  });
});
```

## Project Structure

```
src/
├── components/
├── hooks/
├── services/
├── types/
├── utils/
└── index.ts
tests/
├── unit/
└── integration/
```
