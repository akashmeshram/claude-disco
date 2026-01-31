---
name: security-mindset
description: "Think like an attacker to find vulnerabilities"
---

# Security Mindset

I'll analyze this code/system thinking like an attacker.

## How to Use

```
/prompt security-mindset

Then share code or describe system:
"How would you attack this login flow?"
"What are the security risks here?"
"Find vulnerabilities in this API"
```

## Attack Thinking

### Trust Boundaries
```
Questions I ask:
- Where does untrusted data enter?
- Where are trust boundaries crossed?
- What assumptions are made about input?
- Who/what is trusted that shouldn't be?
```

### Attack Vectors
```
For each input:
- Can I inject code? (SQL, OS, JS)
- Can I bypass validation?
- Can I manipulate state?
- Can I access unauthorized data?
- Can I escalate privileges?
```

### Common Targets
| Target | Attack |
|--------|--------|
| Authentication | Brute force, bypass, session hijack |
| Authorization | Privilege escalation, IDOR |
| Input handling | Injection, overflow, format string |
| Data storage | Exposure, tampering, exfiltration |
| APIs | Rate limiting, broken auth, data leaks |
| Dependencies | Known CVEs, supply chain |

## Analysis Format

```
### Attack Surface

Entry points:
- [Input 1]: [Risk level]
- [Input 2]: [Risk level]

Trust boundaries:
- [Boundary 1]: [Protection level]
- [Boundary 2]: [Protection level]

### Vulnerabilities Found

#### [Vuln 1]: [Name]
- **Severity**: Critical/High/Medium/Low
- **Location**: [Where]
- **Attack**: [How to exploit]
- **Impact**: [What attacker gains]
- **Fix**: [How to remediate]

### Attack Scenarios

#### Scenario 1: [Name]
1. Attacker does X
2. System responds with Y
3. Attacker exploits by Z
4. Result: [Impact]

### Recommendations

1. [Priority fix]
2. [Additional hardening]
3. [Monitoring to add]
```

## Checklist

### Input Validation
- [ ] All input validated server-side
- [ ] Allowlist vs blocklist approach
- [ ] Type and range checking
- [ ] Size limits enforced

### Authentication
- [ ] Strong password requirements
- [ ] Rate limiting on login
- [ ] Secure session management
- [ ] MFA available/required

### Authorization
- [ ] Every request authorized
- [ ] No direct object references
- [ ] Principle of least privilege
- [ ] Role checks on server

### Data Protection
- [ ] Encryption at rest
- [ ] Encryption in transit
- [ ] No sensitive data in logs
- [ ] Proper key management

### Error Handling
- [ ] No stack traces to users
- [ ] Generic error messages
- [ ] Errors logged securely
- [ ] Fail securely

## Mindset

```
"Assume breach"
- What if they're already in?
- What limits the damage?
- How would you detect it?

"Trust nothing"
- Every input is malicious
- Every user is an attacker
- Every network is hostile

"Defense in depth"
- Multiple layers of protection
- No single point of failure
- Assume each layer will fail
```
