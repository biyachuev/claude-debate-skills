# Contributing

Thanks for your interest in contributing to Claude Debate Skills!

## Adding a new skill

1. Create a new directory under `.claude/skills/<your-skill-name>/`.
2. Add a `SKILL.md` file with YAML frontmatter (`name`, `description`, `argument-hint`, `disable-model-invocation: true`).
3. Follow the existing protocol structure: independent positions, cross-critique, revision, final synthesis.
4. Include log file resolution rules (see any existing skill for the pattern).
5. Add a Codex availability check — the skill must refuse to fabricate Codex output if the plugin is not active.
6. Add prompt templates in `prompts/en/` and `prompts/ru/` (or at least English).
7. Update `README.md` — add the skill to the table and to the installation symlink commands.

## Improving existing skills

- Open an issue first to discuss the change.
- Keep protocol stages stable — existing users may rely on the current output format.
- If you change logging behavior, update both the skill file and the corresponding prompt templates.

## Style guidelines

- Skills are written in English. They follow the user's language at runtime.
- Prompt templates exist in both English (`prompts/en/`) and Russian (`prompts/ru/`).
- Keep skill files self-contained — a skill should not depend on another skill.

## Pull requests

- One skill or change per PR.
- Include a brief example of the skill in action (paste a sample invocation and describe the expected output).
- Run `bash scripts/validate-structure.sh` before opening the PR.
- Make sure existing skills still work after your changes.

## Questions?

Open an issue — happy to discuss ideas before you invest time in implementation.
