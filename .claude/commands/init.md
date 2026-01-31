---
name: init
description: "Initialize configs (CI, linting, testing, Docker). Usage: /init [config-type]"
---

# Init Command

Initialize development configurations and tooling.

## Usage

```
/init                     # Interactive - ask what to configure
/init ci                  # CI/CD pipeline
/init lint                # Linting & formatting
/init test                # Testing infrastructure
/init docker              # Containerization
/init hooks               # Git hooks (pre-commit, etc.)
/init all                 # Full configuration suite
```

## Config Types

| Type | Creates | Options |
|------|---------|---------|
| `ci` | CI/CD pipeline | GitHub Actions, GitLab CI |
| `lint` | Code quality | ESLint, Prettier, Biome |
| `test` | Test setup | Vitest, Jest, Pytest |
| `docker` | Containers | Dockerfile, docker-compose |
| `hooks` | Git hooks | Husky, lint-staged |
| `all` | Everything | All of the above |

## Examples

```
/init ci                  # Set up GitHub Actions CI
/init ci gitlab           # Set up GitLab CI instead
/init lint                # Add ESLint + Prettier
/init lint biome          # Use Biome instead
/init test vitest         # Set up Vitest
/init docker              # Add Dockerfile + compose
/init all                 # Initialize everything
```

## Instructions

1. Parse arguments to determine config type(s)
2. If no type specified, ask what to configure
3. Detect existing stack:
   - Check package.json, pyproject.toml, go.mod, etc.
   - Note existing configs to avoid overwriting
4. Launch `config-initializer` agent with Task tool
5. Prompt should include:
   - Config type requested
   - Detected stack/language
   - Existing configs found
   - Platform preferences (if specified)
6. After initialization, summarize:
   - Files created
   - Package updates needed
   - Commands to verify setup

## Agent Configuration

```
subagent_type: config-initializer
prompt: |
  Initialize {type} configuration for this project.

  First:
  1. Detect the project stack (language, framework)
  2. Check for existing configs (don't overwrite)
  3. Identify best tools for this stack

  Then:
  1. Create necessary config files
  2. Update package.json/pyproject.toml with scripts
  3. Add required devDependencies

  Output:
  - Files created with brief description
  - Commands to install dependencies
  - Commands to verify setup works
  - Any manual steps needed
```
