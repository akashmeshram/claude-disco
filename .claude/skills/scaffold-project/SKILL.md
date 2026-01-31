---
name: scaffold-project
description: "Scaffold new projects with proper structure and boilerplate. Use for creating APIs, CLIs, web apps, or libraries from scratch."
---

# Scaffold Project

Create new project structures with proper organization and essential files.

## Available Project Types

| Type | Description |
|------|-------------|
| `api` | REST API with routes, controllers, services |
| `cli` | Command-line tool with argument parsing |
| `webapp` | Web application (React, Vue, etc.) |
| `library` | Reusable package/library |
| Custom | Describe your needs |

## Quick Reference

| User Request | Action |
|--------------|--------|
| "Create a new API" | Scaffold API structure |
| "Start a CLI project" | Scaffold CLI structure |
| "New React app" | Scaffold webapp structure |
| "Create a library" | Scaffold library structure |

## Agent

Use `subagent_type: project-scaffolder` with a detailed prompt including:
- Project type
- Language/framework
- Key features needed
- Any specific requirements
