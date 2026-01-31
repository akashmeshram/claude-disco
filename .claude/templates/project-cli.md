# CLI Tool Project Template

Blueprint for creating command-line interface tools.

## Directory Structure

```
project-root/
├── src/
│   ├── commands/
│   │   ├── index.ts           # Command registry
│   │   ├── init.ts            # Example: init command
│   │   └── run.ts             # Example: run command
│   ├── utils/
│   │   ├── logger.ts          # Logging utilities
│   │   ├── config.ts          # Config file handling
│   │   └── prompts.ts         # Interactive prompts
│   ├── types/
│   │   └── index.ts
│   └── index.ts               # Entry point
├── bin/
│   └── cli.js                 # Executable entry
├── tests/
│   ├── commands/
│   └── utils/
├── .gitignore
├── tsconfig.json
├── package.json
└── README.md
```

## Essential Files

### Executable (`bin/cli.js`)
```javascript
#!/usr/bin/env node
import('../dist/index.js');
```

### Entry Point (`src/index.ts`)
```typescript
import { Command } from 'commander';
import { version, description } from '../package.json';
import { initCommand } from './commands/init';
import { runCommand } from './commands/run';

const program = new Command();

program
  .name('my-cli')
  .description(description)
  .version(version);

// Register commands
program.addCommand(initCommand);
program.addCommand(runCommand);

// Parse arguments
program.parse();
```

### Command Example (`src/commands/init.ts`)
```typescript
import { Command } from 'commander';
import { confirm, input, select } from '@inquirer/prompts';
import { logger } from '../utils/logger';
import chalk from 'chalk';

export const initCommand = new Command('init')
  .description('Initialize a new project')
  .option('-y, --yes', 'Skip prompts and use defaults')
  .option('-t, --template <name>', 'Template to use')
  .action(async (options) => {
    logger.info('Initializing new project...');

    let template = options.template;

    if (!template && !options.yes) {
      template = await select({
        message: 'Select a template:',
        choices: [
          { name: 'Basic', value: 'basic' },
          { name: 'Full', value: 'full' },
        ],
      });
    }

    template = template || 'basic';

    // Perform initialization
    logger.success(`Project initialized with ${chalk.cyan(template)} template`);
  });
```

### Logger Utility (`src/utils/logger.ts`)
```typescript
import chalk from 'chalk';

export const logger = {
  info: (msg: string) => console.log(chalk.blue('ℹ'), msg),
  success: (msg: string) => console.log(chalk.green('✔'), msg),
  warn: (msg: string) => console.log(chalk.yellow('⚠'), msg),
  error: (msg: string) => console.error(chalk.red('✖'), msg),
  debug: (msg: string) => {
    if (process.env.DEBUG) {
      console.log(chalk.gray('⚙'), msg);
    }
  },
};
```

### Config Utility (`src/utils/config.ts`)
```typescript
import { readFile, writeFile } from 'fs/promises';
import { existsSync } from 'fs';
import { join } from 'path';

const CONFIG_FILE = '.myclirc.json';

interface Config {
  version: string;
  settings: Record<string, unknown>;
}

export async function loadConfig(dir: string = process.cwd()): Promise<Config | null> {
  const configPath = join(dir, CONFIG_FILE);

  if (!existsSync(configPath)) {
    return null;
  }

  const content = await readFile(configPath, 'utf-8');
  return JSON.parse(content);
}

export async function saveConfig(config: Config, dir: string = process.cwd()): Promise<void> {
  const configPath = join(dir, CONFIG_FILE);
  await writeFile(configPath, JSON.stringify(config, null, 2));
}
```

### Progress Indicator (`src/utils/progress.ts`)
```typescript
import ora from 'ora';

export function withSpinner<T>(
  message: string,
  fn: () => Promise<T>
): Promise<T> {
  const spinner = ora(message).start();

  return fn()
    .then((result) => {
      spinner.succeed();
      return result;
    })
    .catch((error) => {
      spinner.fail();
      throw error;
    });
}
```

## Package.json
```json
{
  "name": "my-cli",
  "version": "1.0.0",
  "description": "A CLI tool",
  "type": "module",
  "bin": {
    "my-cli": "./bin/cli.js"
  },
  "files": [
    "bin",
    "dist"
  ],
  "scripts": {
    "dev": "tsx src/index.ts",
    "build": "tsc",
    "test": "vitest",
    "lint": "eslint src/",
    "prepublishOnly": "npm run build"
  },
  "dependencies": {
    "commander": "^12.0.0",
    "@inquirer/prompts": "^4.0.0",
    "chalk": "^5.0.0",
    "ora": "^8.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "tsx": "^4.0.0",
    "vitest": "^1.0.0",
    "@types/node": "^20.0.0"
  }
}
```

## Testing CLI Commands

### Test Setup (`tests/commands/init.test.ts`)
```typescript
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { initCommand } from '../../src/commands/init';

// Mock inquirer
vi.mock('@inquirer/prompts', () => ({
  select: vi.fn().mockResolvedValue('basic'),
  input: vi.fn().mockResolvedValue('test-project'),
}));

describe('init command', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  it('initializes with template option', async () => {
    // Test implementation
  });

  it('prompts for template when not provided', async () => {
    // Test implementation
  });
});
```

## Best Practices

### User Experience
- Provide helpful `--help` output
- Use colors for better readability
- Show progress for long operations
- Provide clear error messages

### Command Design
- Keep commands focused (single responsibility)
- Use sensible defaults
- Support both interactive and non-interactive modes
- Validate inputs early

### Distribution
- Include only necessary files in npm package
- Provide pre-built binaries for major platforms (optional)
- Document installation methods
- Include man pages for complex CLIs

### Error Handling
```typescript
process.on('uncaughtException', (error) => {
  logger.error(`Unexpected error: ${error.message}`);
  process.exit(1);
});

process.on('unhandledRejection', (reason) => {
  logger.error(`Unhandled rejection: ${reason}`);
  process.exit(1);
});
```
