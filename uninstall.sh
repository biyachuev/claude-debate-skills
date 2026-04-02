#!/usr/bin/env bash

set -euo pipefail

target_root="${HOME}/.claude/skills"

skills=(
  "strategy-debate"
  "creator-critic"
  "options-challenge"
)

for skill in "${skills[@]}"; do
  target_path="$target_root/$skill"

  if [[ -L "$target_path" ]]; then
    rm "$target_path"
    echo "Removed: $target_path"
    continue
  fi

  if [[ -e "$target_path" ]]; then
    echo "Skipped non-symlink path: $target_path" >&2
    continue
  fi

  echo "Not installed: $target_path"
done
