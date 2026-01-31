---
name: on-error
trigger: on_error
description: "Actions when Claude encounters an error"
---

# On-Error Hook

Triggered when Claude encounters an error during operation.

## Error Categories

### 1. Command Failure
When a shell command fails:
- Capture stderr
- Analyze error message
- Suggest fix

### 2. File Operation Failure
When file read/write fails:
- Check permissions
- Check path exists
- Suggest resolution

### 3. Test Failure
When tests fail:
- Parse test output
- Identify failing tests
- Analyze failure reason

### 4. Build Failure
When build/compile fails:
- Parse compiler output
- Identify error location
- Suggest fix

## Response Actions

### Analyze
```
Error detected: [error type]
Command: [what was attempted]
Error: [error message]

Analysis:
- Likely cause: [explanation]
- Location: [file:line if applicable]

Suggested fix:
[Proposed solution]
```

### Auto-Retry (if safe)
For transient errors:
- Network timeouts
- Lock conflicts
- Race conditions

### Escalate
For serious errors:
- Data corruption risk
- Security issues
- Unknown errors

## Output

```
❌ Error encountered

Command: npm install
Exit code: 1
Error: EACCES permission denied

Analysis:
This is a permissions error. The npm cache directory
is not writable by the current user.

Suggested fixes:
1. Fix permissions: sudo chown -R $USER ~/.npm
2. Use different cache: npm install --cache /tmp/npm

Try fix #1? (y/n)
```

## Configuration

In `.claude/settings.json`:
```json
{
  "hooks": {
    "on-error": {
      "auto-analyze": true,
      "auto-retry-transient": true,
      "max-retries": 3,
      "escalate-unknown": true
    }
  }
}
```
