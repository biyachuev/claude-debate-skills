# Options Challenge Prompt

Use this prompt when you have multiple plausible paths and want a harder comparison instead of a soft brainstorm.

```text
Run the Options Challenge protocol between Claude and Codex on the brief below.

Mandatory requirements:
1. First, formulate 2-4 genuinely different options.
2. Then Codex must challenge each option on trade-offs and execution risk.
3. Then Codex must separately pressure-test the top-1 option and runner-up.
4. Then reassemble the ranking.
5. End with a final recommendation and explain why the alternatives were not chosen.
6. If I pass `No Log`, `Log: none`, or `Log File: none`, do not save anything to a file, do not show Log Path, and do not write `Log saved`.
7. Otherwise, if I pass `Log File:` or `Save As:`, use that name or path for saving.
8. If no path is given, save to `.claude/debate-logs/`.
9. After completion, explicitly write `Log saved: <path>`.
10. If Codex is not available, say so directly and do not simulate its responses.

Response format:
- Log Path (skip if No Log)
- Decision Brief
- Option Set
- Codex Challenge
- Top Options Stress Test
- Revised Ranking
- Final Recommendation
- Why Not The Alternatives
- Key Assumptions

Parameters:
- Finalizer: Claude
- Log File: <filename or relative path, optional>
- Decision Brief: <insert the decision or dilemma>
- Constraints: <constraints>
```

## Suggested usage

```text
/options-challenge Log File: gtm-paths-q3. Decision Brief: Compare direct-to-student, educator-led, and partnership GTM paths. Constraints: small team, one quarter to show traction.
```
