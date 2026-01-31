---
name: analyze-codebase
description: "Run codebase analysis with specialized agents. Use for architecture, dependencies, performance, or code quality review."
---

# Analyze Codebase

Launch appropriate analysis agent(s) based on user request.

## Available Agents

| Agent | Use For |
|-------|---------|
| `repo-architecture-scanner` | Structure, tech stack, entry points |
| `codebase-analyzer` | Trace specific flows, call graphs |
| `dependency-analyzer` | Imports, cycles, coupling |
| `performance-analyzer` | Bottlenecks, complexity, scaling |
| `dead-code-analyzer` | Unused code, doc drift |
| `error-flow-analyzer` | Error handling, silent failures |
| `state-flow-analyzer` | State mutations, race conditions |
| `domain-logic-mapper` | Business logic, invariants |
| `interface-contract-analyzer` | API contracts, validation |
| `cross-cutting-concern-analyzer` | Auth, logging, resilience |
| `architecture-synthesizer` | Combine multiple reports |
| `report-critic` | Review report accuracy |

## Quick Reference

| User Request | Agent to Launch |
|--------------|-----------------|
| "How is this organized?" | repo-architecture-scanner |
| "Trace this function" | codebase-analyzer |
| "Find circular imports" | dependency-analyzer |
| "Why is this slow?" | performance-analyzer |
| "Find unused code" | dead-code-analyzer |
| "Check error handling" | error-flow-analyzer |
| "Full codebase review" | Multiple → architecture-synthesizer |

## Agent

Use `subagent_type: [agent-name]`
