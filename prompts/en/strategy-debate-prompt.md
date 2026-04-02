# Strategy Debate Prompt

Use this prompt in Claude Extension when you want Claude to orchestrate a visible multi-round discussion with Codex and save the full transcript.

```text
Run a structured discussion protocol between Claude and Codex on the topic below.

Mandatory requirements:
1. Show both Claude's position and Codex's position in the response. Do not reduce Codex to a brief summary.
2. Complete the full cycle:
   - Claude v1
   - Codex v1
   - Claude -> Codex Critique
   - Codex -> Claude Critique
   - Claude v2
   - Codex v2
   - Final Synthesis by the chosen finalizer
   - Unresolved Disagreements
   - Recommendation
   - Confidence
   - Protocol Summary
3. If I pass `No Log`, `Log: none`, or `Log File: none`, do not save anything to a file, do not show Log Path, and do not write `Log saved`.
4. Otherwise, save the full protocol to a file within the project and show the exact path at the beginning of the response.
5. If I pass `Log File:` or `Save As:`, use that name or path for saving.
6. If I do not pass a path, save by default to `.claude/debate-logs/`.
7. After completion, explicitly write `Log saved: <path>`.
8. If Codex is not available in this session, say so directly and do not simulate its responses.

Response format:
- Log Path (skip if No Log)
- Topic
- Claude v1
- Codex v1
- Claude -> Codex Critique
- Codex -> Claude Critique
- Claude v2
- Codex v2
- Final Synthesis
- Unresolved Disagreements
- Recommendation
- Confidence
- Protocol Summary

Parameters:
- Finalizer: Claude
- Log File: <filename or relative path, optional>
- Topic: <insert topic>
- Goal: <what decision or conclusion is needed>
- Constraints: <constraints, context, inputs>

Write `Protocol Summary` in the same language as the `Topic`. If the topic is in two languages or the language is ambiguous, use the main language of the brief.
```

## Suggested usage

If you install the local skill from `.claude/skills/strategy-debate`, use:

```text
/strategy-debate Finalizer: Claude. Topic: <topic>. Goal: <goal>. Constraints: <constraints>.
```
