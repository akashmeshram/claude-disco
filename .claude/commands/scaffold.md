---
name: scaffold
description: "Scaffold a new project. Usage: /scaffold [type] [name]"
---

# Scaffold Command

Create new projects with proper structure and boilerplate.

## Usage

```
/scaffold                     # Interactive - ask for type
/scaffold api                 # REST API project
/scaffold cli                 # CLI tool project
/scaffold webapp              # Web application
/scaffold library             # Reusable library/package
/scaffold [custom]            # Describe custom needs
```

## Project Types

| Type | Structure | Best For |
|------|-----------|----------|
| `api` | Routes, controllers, services, models | Backend services |
| `cli` | Commands, utils, bin | Terminal tools |
| `webapp` | Components, pages, hooks, services | Frontend apps |
| `library` | Lib, examples, docs | Reusable packages |

## Examples

```
/scaffold api                 # Create REST API
/scaffold cli my-tool         # Create CLI named "my-tool"
/scaffold webapp react        # Create React web app
/scaffold library utils       # Create utility library
/scaffold microservice        # Custom: describe what you need
```

## Instructions

1. Parse arguments to determine project type and optional name
2. If no type specified, ask user what they want to create
3. Launch `project-scaffolder` agent with Task tool
4. Prompt should include:
   - Project type
   - Project name (if provided)
   - Any additional context from user
5. After scaffolding, summarize:
   - Files created
   - Next steps to get started
   - How to customize

## Agent Configuration

```
subagent_type: project-scaffolder
prompt: |
  Scaffold a new {type} project{name ? " named " + name : ""}.

  Requirements:
  - Follow the {type} template structure
  - Include essential configs (.gitignore, README, etc.)
  - Set up testing infrastructure
  - Add common scripts to package.json (or equivalent)

  After creating the structure:
  1. List all files created
  2. Provide next steps
  3. Note any customization points
```
