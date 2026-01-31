---
name: create
description: "Generate a new component/feature. Usage: /create [type] [name]"
---

# Create Command

Generate new features, components, services, and modules.

## Usage

```
/create                           # Interactive - ask what to create
/create component [name]          # UI component
/create service [name]            # Business logic service
/create api [name]                # API endpoint
/create model [name]              # Data model/entity
/create hook [name]               # React hook
/create test [target]             # Test file for existing code
```

## Generation Types

| Type | Creates | Includes |
|------|---------|----------|
| `component` | UI component | Component + styles + test + index |
| `service` | Service class/module | Service + interface + test |
| `api` | API endpoint | Route + controller + service + test |
| `model` | Data model | Type + validation + factory + test |
| `hook` | React hook | Hook + test |
| `test` | Test file | Tests for existing file |

## Examples

```
/create component Button          # Create Button component
/create component UserProfile     # Create UserProfile component
/create service AuthService       # Create auth service
/create api users                 # Create /users endpoint
/create model Order               # Create Order model
/create hook useLocalStorage      # Create custom hook
/create test src/utils/format.ts  # Create tests for format.ts
```

## Instructions

1. Parse arguments to determine type and name
2. If incomplete, ask user for missing info
3. Before generating, analyze existing patterns:
   - Find similar files in the codebase
   - Note naming conventions
   - Check test structure
4. Launch `feature-generator` agent with Task tool
5. Prompt should include:
   - Type to generate
   - Name for the feature
   - Existing patterns found
   - Test requirements
6. After generation, summarize:
   - Files created
   - Files updated (exports, etc.)
   - How to use the new feature

## Agent Configuration

```
subagent_type: feature-generator
prompt: |
  Generate a new {type} named "{name}".

  Before generating:
  1. Find existing {type}s in the codebase
  2. Match their patterns exactly:
     - File naming convention
     - Code structure
     - Import style
     - Test organization

  Generate:
  - Main implementation file
  - Test file with common scenarios
  - Type definitions if needed
  - Update index/export files

  Output:
  - List of files created
  - List of files updated
  - Usage example
```

## Cognitive Debiasing

### Code Generation Biases

| Bias | Trap | How /create Counters |
|------|------|----------------------|
| **Personal style** | Generating your preferred pattern | Matches existing codebase patterns |
| **Over-engineering** | Adding unnecessary complexity | Generates minimal scaffolding |
| **Under-testing** | Skipping test generation | Always includes tests |
| **Incompleteness** | Missing integration points | Updates exports and indexes |

## Human Factors

### Why Consistency Matters

Inconsistent code generation causes:
- Cognitive load: Multiple patterns to learn
- Maintenance burden: Different structures need different approaches
- Onboarding friction: "Why is this different?"

### Matching Patterns Checklist

Before generation, verify:
- [ ] File naming matches existing conventions
- [ ] Directory placement follows existing structure
- [ ] Import style matches existing code
- [ ] Test file naming and structure match
- [ ] Export patterns match (barrel files, named exports)

## Decision Science

### What to Generate vs. What to Leave

| Generate | Skip |
|----------|------|
| Main implementation | Feature-specific logic |
| Test scaffolding | Detailed test cases |
| Type definitions | Complex type relationships |
| Integration (exports) | Cross-feature integration |

The developer fills in the specifics. Generation provides structure.
