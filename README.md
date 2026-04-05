# Claude Debate Skills

![Claude Code](https://img.shields.io/badge/Claude_Code-skill-blue)
![Codex](https://img.shields.io/badge/Codex-plugin-orange)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

Reusable Claude Code skills for strategy discussions, idea generation, critique, and decision pressure-testing.

Two AI models, Claude (Anthropic) and Codex (OpenAI), debate each other through structured protocols instead of giving you a single unchallenged answer. Different training data, different blind spots, structured disagreement that surfaces what one model alone would miss.

## Quick Start

```bash
# 1. Install Codex CLI
npm install -g @openai/codex && codex login

# 2. Install Codex plugin for Claude Code (from within Claude Code)
/install-plugin codex

# 3. Clone this repository and install the skills
git clone https://github.com/biyachuev/claude-debate-skills.git
cd claude-debate-skills
./install.sh

# 4. Open any project in Claude Code and run:
/strategy-debate Topic: Should we go after SMB or enterprise first? Constraints: team of 6, need fast feedback loops.
```

To remove the global symlinks later, run:

```bash
./uninstall.sh
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (CLI or VS Code extension)
- [Codex CLI](https://github.com/openai/codex) — `npm install -g @openai/codex`, then `codex login`
- [Codex plugin for Claude Code](https://github.com/openai/codex-plugin-cc) — install from within Claude Code

## Included skills

| Skill | Purpose | Solo fallback |
|---|---|---|
| `strategy-debate` | Two-voice debate with cross-critique, revision, and final synthesis | No — two-voice by design |
| `creator-critic` | One side generates options, the other pressure-tests them, then the creator revises | Yes — pass `Creator: Claude. Critic: Claude.` |
| `options-challenge` | Compare several strategic paths, challenge trade-offs, and rank the best option | No — Codex challenge is structural |

Skill files:

- [`.claude/skills/strategy-debate/SKILL.md`](.claude/skills/strategy-debate/SKILL.md)
- [`.claude/skills/creator-critic/SKILL.md`](.claude/skills/creator-critic/SKILL.md)
- [`.claude/skills/options-challenge/SKILL.md`](.claude/skills/options-challenge/SKILL.md)

## When To Use Which Skill

| Situation | Recommended skill | Why |
|---|---|---|
| You need a hard comparison between several plausible paths | `options-challenge` | Forces ranking and trade-offs instead of a soft brainstorm |
| You need two independent positions and cross-critique before a decision | `strategy-debate` | Best for strategy, architecture, research direction, and planning |
| You need breadth first, then filtering and revision | `creator-critic` | Good for ideas, naming, positioning, campaigns, and concept generation |

## When Debate Is A Bad Fit

- The answer is mostly factual and can be verified directly.
- The task is trivial and not worth spending tokens from two models.
- You need the fastest possible answer.
- The brief contains sensitive material that you should not send to multiple vendors.

## Invocation Examples

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

## Log Files

All skills support `Log File:` or `Save As:`.

| Input | Result |
|---|---|
| `Log File: my-note` | `.claude/debate-logs/my-note.md` |
| `Log File: my-note.md` | `.claude/debate-logs/my-note.md` |
| `Log File: notes/decisions/my-note.md` | Relative path in the current project |
| Omitted | Session-based filename in `.claude/debate-logs/` |
| `No Log` / `Log: none` / `Log File: none` | No file written, full debate in chat only |

When skills are installed globally, the log file is resolved relative to the currently active project, not this repository.

## Privacy And Data Handling

- Your brief may be sent to both Claude and Codex during the debate.
- If logging is enabled, the visible transcript is written to a local Markdown file.
- Use `No Log`, `Log: none`, or `Log File: none` if you do not want a local transcript.
- Do not use these skills for credentials, secrets, regulated data, or anything you would not want to send to multiple AI providers.

## Language Behavior

- Skills follow the language of the user brief unless the prompt explicitly asks for another output language.
- In `strategy-debate`, `Protocol Summary` follows the language of `Topic`. If the topic is mixed-language, the skill uses the main language of the brief.

## Installation

### Option 1: global install script (recommended)

Keep this repository anywhere on disk and run:

```bash
./install.sh
```

This creates symlinks in `~/.claude/skills/` for all three skills.

To remove them later:

```bash
./uninstall.sh
```

### Option 2: manual global symlinks

```bash
mkdir -p ~/.claude/skills
ln -s "/absolute/path/to/repo/.claude/skills/strategy-debate" ~/.claude/skills/strategy-debate
ln -s "/absolute/path/to/repo/.claude/skills/creator-critic" ~/.claude/skills/creator-critic
ln -s "/absolute/path/to/repo/.claude/skills/options-challenge" ~/.claude/skills/options-challenge
```

After that, the slash commands are available in any project opened in Claude Code.

### Option 3: project-local skills

Copy or symlink the skill directories into the target project's `.claude/skills/` folder.

```bash
mkdir -p /path/to/project/.claude/skills
ln -s "/absolute/path/to/repo/.claude/skills/strategy-debate" /path/to/project/.claude/skills/strategy-debate
```

This is useful if you want different projects to expose different skills.

## Prompt Templates

If you prefer copy-paste prompts over slash commands, ready-made templates are available in two languages:

| Skill | English | Russian |
|---|---|---|
| Strategy Debate | [`prompts/en/strategy-debate-prompt.md`](prompts/en/strategy-debate-prompt.md) | [`prompts/ru/strategy-debate-prompt.md`](prompts/ru/strategy-debate-prompt.md) |
| Creator-Critic | [`prompts/en/creator-critic-prompt.md`](prompts/en/creator-critic-prompt.md) | [`prompts/ru/creator-critic-prompt.md`](prompts/ru/creator-critic-prompt.md) |
| Options Challenge | [`prompts/en/options-challenge-prompt.md`](prompts/en/options-challenge-prompt.md) | [`prompts/ru/options-challenge-prompt.md`](prompts/ru/options-challenge-prompt.md) |

## Troubleshooting

- `Claude refuses to call Codex`: make sure the Codex plugin is installed in Claude Code and `codex login` has completed successfully.
- `The slash command does not exist`: verify that the symlink exists under `~/.claude/skills/` and points to this repository.
- `The skill works but no log file appears`: check whether you passed `No Log` or `Log File: none`, and remember that relative log paths resolve from the currently open project.
- `I only see Claude output`: the skill is designed to stop instead of fabricating Codex output when Codex is unavailable.
- `The symlink already exists`: remove the old path manually or run `./uninstall.sh` first, then install again.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new skills or improving existing ones.

## License

[MIT](LICENSE)

---

## На русском

Набор переиспользуемых скиллов для Claude Code, которые превращают AI-советчиков в структурированных оппонентов.

Две модели, Claude (Anthropic) и Codex (OpenAI), спорят друг с другом по заданному протоколу вместо того, чтобы давать один бесспорный ответ. Разные данные обучения, разные слепые зоны, структурированный спор вскрывает то, что одна модель пропустила бы.

### Три скилла

- **`/strategy-debate`** — глубокий анализ. Обе модели независимо формулируют позицию, в раундах перекрёстной критики атакуют слабые места друг друга, пересматривают аргументы. Финализатор подводит итог. Для бизнес-стратегий, архитектурных решений, планирования.
- **`/creator-critic`** — генерация и отсев. Одна модель предлагает 3-5 вариантов, другая разбирает каждый: ценность, главный изъян, скрытое допущение, вероятный сценарий провала. Creator пересматривает список и сужает до лучших. Поддерживает режим без Codex через `Creator: Claude. Critic: Claude.`.
- **`/options-challenge`** — выбор из нескольких путей. Claude формулирует 2-4 варианта, Codex атакует каждый по trade-offs и рискам исполнения, Claude пересобирает рейтинг. Codex дожимает два лучших, и на выходе получается карта решения с явными компромиссами.

### Быстрый старт

```bash
# 1. Установить Codex CLI
npm install -g @openai/codex && codex login

# 2. Установить Codex-плагин для Claude Code
/install-plugin codex

# 3. Клонировать репозиторий и поставить скиллы
git clone https://github.com/biyachuev/claude-debate-skills.git
cd claude-debate-skills
./install.sh

# 4. Открыть любой проект в Claude Code и запустить
/strategy-debate Topic: Стоит ли выходить на SMB или enterprise первым? Constraints: команда из 6, нужна быстрая обратная связь.
```

### Что нужно

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (CLI или расширение VS Code)
- [Codex CLI](https://github.com/openai/codex) — `npm install -g @openai/codex`, затем `codex login`
- [Codex-плагин для Claude Code](https://github.com/openai/codex-plugin-cc)

### Что важно знать

- Бриф может быть отправлен сразу двум вендорам: Anthropic и OpenAI.
- Если логирование включено, транскрипт дебатов сохраняется локально в Markdown.
- Чтобы не писать лог, используйте `No Log`, `Log: none` или `Log File: none`.
- Не прогоняйте через эти скиллы секреты, ключи, персональные данные и другой чувствительный контент.
