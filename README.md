# Claude Debate Skills

Reusable Claude Code skills for strategy discussions, idea generation, critique, and decision pressure-testing.

This repository is set up to act as a skill library you can keep on GitHub and reuse across projects.

## Included skills

- `strategy-debate`: two-voice Claude + Codex debate with cross-critique, revision, and final synthesis.
- `creator-critic`: one side generates options, the other pressure-tests them, then the creator revises.
- `options-challenge`: compare several strategic paths, challenge trade-offs, and rank the best option.

The skill files live in:

- [`.claude/skills/strategy-debate/SKILL.md`](.claude/skills/strategy-debate/SKILL.md)
- [`.claude/skills/creator-critic/SKILL.md`](.claude/skills/creator-critic/SKILL.md)
- [`.claude/skills/options-challenge/SKILL.md`](.claude/skills/options-challenge/SKILL.md)

## Codex requirement

These skills are designed around a Claude + Codex two-voice structure. Codex is the second AI agent available in Claude Code when the [Codex plugin](https://github.com/openai/codex) is installed and active in the session. Most skills require Codex; `creator-critic` has a solo fallback.

**How to check availability:** just run any skill. Claude will immediately say
"Codex is not available in this session" and stop rather than fabricate its output.

**If Codex is unavailable:**

| Skill | Solo fallback |
|---|---|
| `creator-critic` | Pass `Creator: Claude. Critic: Claude.` — Claude runs both roles |
| `strategy-debate` | No built-in solo mode — two-voice by design |
| `options-challenge` | No built-in solo mode — Codex challenge is structural |

## How to use in this project

Open Claude Code or Claude Extension in this repository and run:

```text
/strategy-debate Finalizer: Claude. Log File: smb-vs-enterprise. Topic: Should we go after SMB or enterprise first? Constraints: team of 6, low sales capacity, need fast feedback loops.
```

```text
/creator-critic Log File: pricing-ideas. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```

```text
/creator-critic Creator: Claude. Critic: Claude. Finalizer: Claude. Log File: pricing-ideas-solo. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```

```text
/options-challenge Log File: gtm-paths-q3. Decision Brief: Compare direct-to-student, educator-led, and partnership GTM paths. Constraints: small team, one quarter to show traction.
```

## Log files

All skills support `Log File:` or `Save As:`.

Rules:

- `Log File: my-note` saves to `.claude/debate-logs/my-note.md`
- `Log File: my-note.md` saves to `.claude/debate-logs/my-note.md`
- `Log File: notes/decisions/my-note.md` saves to that relative path in the current project
- if omitted, the skill falls back to a session-based filename in `.claude/debate-logs/`

To skip logging entirely, pass `No Log`, `Log: none`, or `Log File: none`. The skill will run the full debate in chat without writing any files.

When skills are installed globally, the log file is still resolved relative to the currently active project, not this repository.

## Language behavior

- Skills follow the language of the user brief unless the prompt explicitly asks for another output language.
- In `strategy-debate`, `Protocol Summary` follows the language of `Topic`. If the topic is mixed-language, the skill uses the main language of the brief.

## Use across any project

You have two practical installation modes.

### Option 1: global skills

Keep this repository anywhere on disk and symlink each skill into `~/.claude/skills/`.

```bash
mkdir -p ~/.claude/skills
ln -s "/absolute/path/to/repo/.claude/skills/strategy-debate" ~/.claude/skills/strategy-debate
ln -s "/absolute/path/to/repo/.claude/skills/creator-critic" ~/.claude/skills/creator-critic
ln -s "/absolute/path/to/repo/.claude/skills/options-challenge" ~/.claude/skills/options-challenge
```

After that, the slash commands are available in any project opened in Claude Code.

### Option 2: project-local skills

Copy or symlink the skill directories into the target project's `.claude/skills/` folder.

```bash
mkdir -p /path/to/project/.claude/skills
ln -s "/absolute/path/to/repo/.claude/skills/strategy-debate" /path/to/project/.claude/skills/strategy-debate
```

This is useful if you want different projects to expose different skills.

## Prompt templates

Paste-ready prompt versions live in:

- [`prompts/strategy-debate-prompt.md`](prompts/strategy-debate-prompt.md)
- [`prompts/creator-critic-prompt.md`](prompts/creator-critic-prompt.md)
- [`prompts/options-challenge-prompt.md`](prompts/options-challenge-prompt.md)

## License

[MIT](LICENSE)
