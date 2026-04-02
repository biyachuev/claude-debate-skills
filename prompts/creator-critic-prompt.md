# Creator Critic Prompt

Use this prompt when you want one voice to generate options and the other to pressure-test them before a final recommendation.

```text
Запусти протокол Creator-Critic по брифу ниже, используя выбранные роли Creator / Critic / Finalizer.

Обязательные требования:
1. Покажи обе роли в ответе. Если роль Critic отдана Codex, не своди его вклад к краткому пересказу. Если обе роли выполняет Claude, покажи Creator и Critic как явно разделённые голоса.
2. Creator должен предложить 3-5 разных вариантов.
3. Critic должен разобрать каждый вариант:
   - strongest value
   - biggest flaw
   - hidden assumption
   - likely failure mode
4. Затем Creator должен сократить и усилить набор до 1-3 лучших вариантов.
5. В конце дай финальную рекомендацию.
6. Если я передал `No Log`, `Log: none` или `Log File: none`, не сохраняй ничего в файл, не показывай Log Path и не пиши строку `Log saved`.
7. Иначе, если я передал `Log File:` или `Save As:`, используй это имя или путь для сохранения.
8. Если путь не указан, сохрани в `.claude/debate-logs/`.
9. После завершения явно напиши `Log saved: <path>`.
10. Если Codex недоступен, скажи это прямо и не имитируй его ответы.
11. Если обе выбранные роли выполняет Claude, можно провести протокол без Codex.

Формат ответа:
- Log Path (пропусти если No Log)
- Brief
- Creator v1
- Critic Review
- Creator v2
- Final Recommendation
- Open Risks
- Next Moves

Параметры:
- Creator: Claude
- Critic: Codex
- Finalizer: Claude
- Log File: <имя файла или относительный путь, опционально>
- Brief: <вставь бриф>
- Constraints: <ограничения>
```

## Suggested usage

```text
/creator-critic Log File: pricing-ideas. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```

Solo fallback without Codex:

```text
/creator-critic Creator: Claude. Critic: Claude. Finalizer: Claude. Log File: pricing-ideas-solo. Brief: Generate and pressure-test pricing ideas for an AI debate copilot. Constraints: simple plans, low trust, early-stage product.
```
