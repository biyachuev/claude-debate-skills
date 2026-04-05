#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

required_files=(
  "README.md"
  "LICENSE"
  "CONTRIBUTING.md"
  "install.sh"
  "uninstall.sh"
  ".claude-plugin/plugin.json"
  "skills/strategy-debate/SKILL.md"
  "skills/creator-critic/SKILL.md"
  "skills/options-challenge/SKILL.md"
  "prompts/en/strategy-debate-prompt.md"
  "prompts/en/creator-critic-prompt.md"
  "prompts/en/options-challenge-prompt.md"
  "prompts/ru/strategy-debate-prompt.md"
  "prompts/ru/creator-critic-prompt.md"
  "prompts/ru/options-challenge-prompt.md"
)

for path in "${required_files[@]}"; do
  if [[ ! -f "$path" ]]; then
    echo "Missing required file: $path" >&2
    exit 1
  fi
done

skills=(
  "strategy-debate"
  "creator-critic"
  "options-challenge"
)

for skill in "${skills[@]}"; do
  skill_file="skills/${skill}/SKILL.md"

  if ! grep -q "^name: ${skill}$" "$skill_file"; then
    echo "Skill metadata mismatch in $skill_file: expected name ${skill}" >&2
    exit 1
  fi

  if ! grep -q "^disable-model-invocation: true$" "$skill_file"; then
    echo "Missing disable-model-invocation guard in $skill_file" >&2
    exit 1
  fi
done

echo "Structure validation passed."
