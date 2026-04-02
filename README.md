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

## How to use in this project

Open Claude Code or Claude Extension in this repository and run:

```text
/strategy-debate Finalizer: Claude. Log File: smb-vs-enterprise. Topic: Should we go after SMB or enterprise first? Constraints: team of 6, low sales capacity, need fast feedback loops.
```

```text
/creator-critic Log File: pricing-ideas. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
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

When skills are installed globally, the log file is still resolved relative to the currently active project, not this repository.

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

## Suggested repository flow

1. Initialize this folder as a Git repository.
2. Commit the skills, prompt templates, and README.
3. Push to GitHub.
4. Reuse the skills globally through symlinks, or copy them selectively into project repositories.

## Prompt templates

Paste-ready prompt versions live in:

- [`prompts/strategy-debate-prompt.md`](prompts/strategy-debate-prompt.md)
- [`prompts/creator-critic-prompt.md`](prompts/creator-critic-prompt.md)
- [`prompts/options-challenge-prompt.md`](prompts/options-challenge-prompt.md)
