# Creator Critic Prompt

Use this prompt when you want one voice to generate options and the other to pressure-test them before a final recommendation.

```text
Run the Creator-Critic protocol on the brief below, using the chosen Creator / Critic / Finalizer roles.

Mandatory requirements:
1. Show both roles in the response. If the Critic role is assigned to Codex, do not reduce its contribution to a brief summary. If both roles are performed by Claude, show Creator and Critic as explicitly separate voices.
2. Creator must propose 3-5 different options.
3. Critic must analyze each option:
   - strongest value
   - biggest flaw
   - hidden assumption
   - likely failure mode
4. Then Creator must narrow and strengthen the set to 1-3 best options.
5. End with a final recommendation.
6. If I pass `No Log`, `Log: none`, or `Log File: none`, do not save anything to a file, do not show Log Path, and do not write `Log saved`.
7. Otherwise, if I pass `Log File:` or `Save As:`, use that name or path for saving.
8. If no path is given, save to `.claude/debate-logs/`.
9. After completion, explicitly write `Log saved: <path>`.
10. If Codex is not available, say so directly and do not simulate its responses.
11. If both chosen roles are performed by Claude, the protocol can run without Codex.

Response format:
- Log Path (skip if No Log)
- Brief
- Creator v1
- Critic Review
- Creator v2
- Final Recommendation
- Open Risks
- Next Moves

Parameters:
- Creator: Claude
- Critic: Codex
- Finalizer: Claude
- Log File: <filename or relative path, optional>
- Brief: <insert brief>
- Constraints: <constraints>
```

## Suggested usage

```text
/creator-critic Log File: pricing-ideas. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```

Solo fallback without Codex:

```text
/creator-critic Creator: Claude. Critic: Claude. Finalizer: Claude. Log File: pricing-ideas-solo. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```
