# Strategy Debate Prompt

Use this prompt in Claude Extension when you want Claude to orchestrate a visible multi-round discussion with Codex and save the full transcript.

```text
Запусти структурированный протокол обсуждения между Claude и Codex по теме ниже.

Обязательные требования:
1. Покажи в ответе и позицию Claude, и позицию Codex. Не своди Codex к краткому пересказу.
2. Проведи полный цикл:
   - Claude v1
   - Codex v1
   - критика Claude -> Codex
   - критика Codex -> Claude
   - Claude v2
   - Codex v2
   - финальный синтез выбранным финализатором
   - оставшиеся разногласия
   - рекомендация
   - confidence
   - protocol summary
3. Сохрани весь протокол в файл внутри проекта и в начале ответа покажи точный путь к файлу.
4. Если я передал `Log File:` или `Save As:`, используй это имя или путь для сохранения.
5. Если я не передал путь, сохрани по умолчанию в `.claude/debate-logs/`.
6. После завершения явно напиши `Log saved: <path>`.
7. Если Codex в этой сессии недоступен, скажи это прямо и не имитируй его ответы.

Формат ответа:
- Log Path
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

Параметры обсуждения:
- Finalizer: Claude
- Log File: <имя файла или относительный путь, опционально>
- Topic: <вставь тему>
- Goal: <какое решение или вывод нужен>
- Constraints: <ограничения, контекст, вводные>

`Protocol Summary` пиши на том же языке, на котором сформулирован `Topic`. Если тема сформулирована на двух языках или язык неоднозначен, используй основной язык брифа.
```

## Suggested usage

If you install the local skill from `.claude/skills/strategy-debate`, use:

```text
/strategy-debate Finalizer: Claude. Topic: <тема>. Goal: <цель>. Constraints: <ограничения>.
```
