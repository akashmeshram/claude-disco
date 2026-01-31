---
name: generate-feature
description: "Generate new features, components, services, and modules that follow existing codebase patterns."
---

# Generate Feature

Create new code following existing patterns in the codebase.

## Available Generation Types

| Type | Description |
|------|-------------|
| `component` | UI component with tests |
| `service` | Business logic service |
| `api` | API endpoint with route, controller, service |
| `model` | Data model/entity |
| `hook` | React custom hook |
| `test` | Test file for existing code |

## Quick Reference

| User Request | Action |
|--------------|--------|
| "Create a Button component" | Generate component + test |
| "Add a UserService" | Generate service + test |
| "New /products endpoint" | Generate API route stack |
| "Add Order model" | Generate model + validation |
| "Create useAuth hook" | Generate hook + test |

## Agent

Use `subagent_type: feature-generator` with a detailed prompt including:
- What type to generate (component, service, etc.)
- Name for the feature
- Specific requirements or behavior
- Integration points if known
