# Library/Package Project Template

Blueprint for creating reusable libraries and npm packages.

## Directory Structure

```
project-root/
├── src/
│   ├── lib/
│   │   ├── core.ts            # Core functionality
│   │   ├── utils.ts           # Utility functions
│   │   └── types.ts           # Type definitions
│   └── index.ts               # Public API exports
├── tests/
│   ├── core.test.ts
│   └── utils.test.ts
├── examples/
│   ├── basic/
│   │   └── index.ts
│   └── advanced/
│       └── index.ts
├── docs/
│   ├── api.md
│   └── guides/
│       └── getting-started.md
├── .gitignore
├── .npmignore
├── tsconfig.json
├── tsconfig.build.json
├── package.json
├── LICENSE
├── CHANGELOG.md
└── README.md
```

## Essential Files

### Entry Point (`src/index.ts`)
```typescript
// Export public API only
// Keep implementation details private

export { CoreClass, createInstance } from './lib/core';
export { formatValue, parseInput } from './lib/utils';
export type { Config, Options, Result } from './lib/types';

// Version export for debugging
export const VERSION = '__VERSION__';
```

### Core Module (`src/lib/core.ts`)
```typescript
import type { Config, Options, Result } from './types';
import { validateConfig, normalizeOptions } from './utils';

const DEFAULT_OPTIONS: Options = {
  timeout: 5000,
  retries: 3,
};

export class CoreClass {
  private config: Config;
  private options: Options;

  constructor(config: Config, options: Partial<Options> = {}) {
    this.config = validateConfig(config);
    this.options = normalizeOptions({ ...DEFAULT_OPTIONS, ...options });
  }

  async execute(input: string): Promise<Result> {
    // Implementation
  }

  // Instance method
  getConfig(): Readonly<Config> {
    return Object.freeze({ ...this.config });
  }
}

// Factory function (alternative to class)
export function createInstance(config: Config, options?: Partial<Options>) {
  return new CoreClass(config, options);
}
```

### Types (`src/lib/types.ts`)
```typescript
/**
 * Configuration for the library
 */
export interface Config {
  /** API endpoint URL */
  endpoint: string;
  /** API key for authentication */
  apiKey: string;
}

/**
 * Optional settings
 */
export interface Options {
  /** Request timeout in milliseconds */
  timeout: number;
  /** Number of retry attempts */
  retries: number;
}

/**
 * Operation result
 */
export interface Result<T = unknown> {
  success: boolean;
  data?: T;
  error?: Error;
}
```

### Utilities (`src/lib/utils.ts`)
```typescript
import type { Config, Options } from './types';

export function validateConfig(config: Config): Config {
  if (!config.endpoint) {
    throw new Error('Config endpoint is required');
  }
  if (!config.apiKey) {
    throw new Error('Config apiKey is required');
  }
  return config;
}

export function normalizeOptions(options: Options): Options {
  return {
    timeout: Math.max(0, options.timeout),
    retries: Math.max(0, Math.min(10, options.retries)),
  };
}

export function formatValue(value: unknown): string {
  if (value === null) return 'null';
  if (value === undefined) return 'undefined';
  if (typeof value === 'object') return JSON.stringify(value);
  return String(value);
}

export function parseInput(input: string): Record<string, unknown> {
  try {
    return JSON.parse(input);
  } catch {
    throw new Error('Invalid JSON input');
  }
}
```

## Package.json
```json
{
  "name": "my-library",
  "version": "1.0.0",
  "description": "A useful library",
  "type": "module",
  "main": "./dist/index.cjs",
  "module": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "exports": {
    ".": {
      "import": "./dist/index.js",
      "require": "./dist/index.cjs",
      "types": "./dist/index.d.ts"
    }
  },
  "files": [
    "dist",
    "README.md",
    "LICENSE"
  ],
  "scripts": {
    "dev": "tsup src/index.ts --watch",
    "build": "tsup src/index.ts --format cjs,esm --dts --clean",
    "test": "vitest",
    "test:coverage": "vitest --coverage",
    "lint": "eslint src/",
    "typecheck": "tsc --noEmit",
    "prepublishOnly": "npm run build && npm test"
  },
  "keywords": ["library", "utility"],
  "author": "Your Name",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/username/my-library"
  },
  "devDependencies": {
    "tsup": "^8.0.0",
    "typescript": "^5.0.0",
    "vitest": "^1.0.0",
    "eslint": "^8.0.0"
  },
  "peerDependencies": {},
  "engines": {
    "node": ">=18"
  }
}
```

## Build Config (`tsup.config.ts`)
```typescript
import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['cjs', 'esm'],
  dts: true,
  clean: true,
  sourcemap: true,
  minify: false,
  splitting: false,
  treeshake: true,
});
```

## TypeScript Config (`tsconfig.json`)
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "lib": ["ES2022"],
    "strict": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "outDir": "dist"
  },
  "include": ["src"],
  "exclude": ["node_modules", "dist", "tests", "examples"]
}
```

## README Template
```markdown
# my-library

Brief description of what the library does.

## Installation

\`\`\`bash
npm install my-library
\`\`\`

## Usage

\`\`\`typescript
import { createInstance } from 'my-library';

const instance = createInstance({
  endpoint: 'https://api.example.com',
  apiKey: 'your-api-key',
});

const result = await instance.execute('input');
\`\`\`

## API

### `createInstance(config, options?)`

Creates a new instance.

#### Parameters

- `config.endpoint` - API endpoint URL
- `config.apiKey` - API key for authentication
- `options.timeout` - Request timeout (default: 5000)
- `options.retries` - Retry attempts (default: 3)

## License

MIT
```

## Best Practices

### API Design
- Export only what's needed (minimal surface area)
- Use named exports for better tree-shaking
- Provide TypeScript types
- Support both ESM and CJS

### Documentation
- Document all public APIs
- Include usage examples
- Maintain a changelog
- Add JSDoc comments

### Testing
- Test public API thoroughly
- Test edge cases
- Achieve high coverage
- Test in both ESM and CJS

### Versioning
- Follow semantic versioning
- Document breaking changes
- Provide migration guides
- Use changesets for releases
