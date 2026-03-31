# Options Challenge Prompt

Use this prompt when you have multiple plausible paths and want a harder comparison instead of a soft brainstorm.

```text
Запусти протокол Options Challenge между Claude и Codex по брифу ниже.

Обязательные требования:
1. Сначала сформулируй 2-4 действительно разных опции.
2. Затем Codex должен атаковать каждую опцию по trade-offs и execution risk.
3. Затем пересобери ranking.
4. В конце дай финальную рекомендацию и объясни, почему не выбраны альтернативы.
5. Если я передал `Log File:` или `Save As:`, используй это имя или путь для сохранения.
6. Если путь не указан, сохрани в `.claude/debate-logs/`.
7. После завершения явно напиши `Log saved: <path>`.
8. Если Codex недоступен, скажи это прямо и не имитируй его ответы.

Формат ответа:
- Log Path
- Decision Brief
- Option Set
- Codex Challenge
- Revised Ranking
- Final Recommendation
- Why Not The Alternatives
- Key Assumptions

Параметры:
- Finalizer: Claude
- Log File: <имя файла или относительный путь, опционально>
- Decision Brief: <вставь решение или дилемму>
- Constraints: <ограничения>
```

## Suggested usage

```text
/options-challenge Log File: gtm-paths-q3. Decision Brief: Compare direct-to-student, educator-led, and partnership GTM paths. Constraints: small team, one quarter to show traction.
```
