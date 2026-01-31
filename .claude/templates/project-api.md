# REST API Project Template

Blueprint for creating backend API services.

## Directory Structure

```
project-root/
├── src/
│   ├── routes/
│   │   ├── index.ts           # Route aggregator
│   │   ├── health.routes.ts   # Health check endpoints
│   │   └── users.routes.ts    # Example resource routes
│   ├── controllers/
│   │   ├── health.controller.ts
│   │   └── users.controller.ts
│   ├── services/
│   │   └── users.service.ts
│   ├── models/
│   │   └── user.model.ts
│   ├── middleware/
│   │   ├── error-handler.ts
│   │   ├── auth.ts
│   │   └── validation.ts
│   ├── utils/
│   │   ├── logger.ts
│   │   └── errors.ts
│   ├── types/
│   │   └── index.ts
│   ├── config/
│   │   └── index.ts
│   └── index.ts               # Entry point
├── tests/
│   ├── unit/
│   │   └── services/
│   └── integration/
│       └── routes/
├── docs/
│   └── api.md
├── .env.example
├── .gitignore
├── .eslintrc.js
├── .prettierrc
├── tsconfig.json
├── package.json
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## Essential Files

### Entry Point (`src/index.ts`)
```typescript
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { config } from './config';
import { routes } from './routes';
import { errorHandler } from './middleware/error-handler';
import { logger } from './utils/logger';

const app = express();

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());

// Routes
app.use('/api', routes);

// Error handling
app.use(errorHandler);

// Start server
app.listen(config.port, () => {
  logger.info(`Server running on port ${config.port}`);
});

export { app };
```

### Route Example (`src/routes/users.routes.ts`)
```typescript
import { Router } from 'express';
import { UsersController } from '../controllers/users.controller';
import { validate } from '../middleware/validation';
import { createUserSchema, updateUserSchema } from '../models/user.model';

const router = Router();
const controller = new UsersController();

router.get('/', controller.findAll);
router.get('/:id', controller.findById);
router.post('/', validate(createUserSchema), controller.create);
router.put('/:id', validate(updateUserSchema), controller.update);
router.delete('/:id', controller.delete);

export { router as usersRoutes };
```

### Controller Example (`src/controllers/users.controller.ts`)
```typescript
import { Request, Response, NextFunction } from 'express';
import { UsersService } from '../services/users.service';

export class UsersController {
  private service = new UsersService();

  findAll = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await this.service.findAll();
      res.json(users);
    } catch (error) {
      next(error);
    }
  };

  findById = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const user = await this.service.findById(req.params.id);
      res.json(user);
    } catch (error) {
      next(error);
    }
  };

  // ... create, update, delete
}
```

### Service Example (`src/services/users.service.ts`)
```typescript
import { User, CreateUserInput, UpdateUserInput } from '../models/user.model';
import { NotFoundError } from '../utils/errors';

export class UsersService {
  async findAll(): Promise<User[]> {
    // Database query
  }

  async findById(id: string): Promise<User> {
    const user = /* database query */;
    if (!user) {
      throw new NotFoundError('User', id);
    }
    return user;
  }

  async create(input: CreateUserInput): Promise<User> {
    // Validation, database insert
  }

  async update(id: string, input: UpdateUserInput): Promise<User> {
    // Find, validate, update
  }

  async delete(id: string): Promise<void> {
    // Find, delete
  }
}
```

### Error Handler (`src/middleware/error-handler.ts`)
```typescript
import { Request, Response, NextFunction } from 'express';
import { AppError } from '../utils/errors';
import { logger } from '../utils/logger';

export function errorHandler(
  error: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  logger.error(error);

  if (error instanceof AppError) {
    return res.status(error.statusCode).json({
      error: error.code,
      message: error.message,
    });
  }

  return res.status(500).json({
    error: 'INTERNAL_ERROR',
    message: 'An unexpected error occurred',
  });
}
```

## Package.json Scripts
```json
{
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc",
    "start": "node dist/index.js",
    "test": "vitest",
    "test:coverage": "vitest --coverage",
    "lint": "eslint src/",
    "format": "prettier --write src/"
  }
}
```

## Key Dependencies
```json
{
  "dependencies": {
    "express": "^4.18.0",
    "cors": "^2.8.0",
    "helmet": "^7.0.0",
    "zod": "^3.22.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "tsx": "^4.0.0",
    "vitest": "^1.0.0",
    "@types/express": "^4.17.0",
    "@types/node": "^20.0.0",
    "eslint": "^8.0.0",
    "prettier": "^3.0.0"
  }
}
```

## Best Practices

### API Design
- Use RESTful conventions
- Version your API (`/api/v1/`)
- Return consistent error formats
- Use proper HTTP status codes

### Security
- Use helmet for security headers
- Validate all inputs with Zod
- Sanitize outputs
- Use parameterized queries

### Testing
- Unit test services
- Integration test routes
- Use factories for test data
- Mock external dependencies
