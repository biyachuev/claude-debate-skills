#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_root="$repo_root/.claude/skills"
target_root="${HOME}/.claude/skills"

skills=(
  "strategy-debate"
  "creator-critic"
  "options-challenge"
)

mkdir -p "$target_root"

for skill in "${skills[@]}"; do
  source_path="$skills_root/$skill"
  target_path="$target_root/$skill"

  if [[ ! -d "$source_path" ]]; then
    echo "Missing skill directory: $source_path" >&2
    exit 1
  fi

  if [[ -L "$target_path" ]]; then
    current_target="$(readlink "$target_path")"
    if [[ "$current_target" == "$source_path" ]]; then
      echo "Already installed: $skill"
      continue
    fi

    echo "Refusing to replace existing symlink: $target_path -> $current_target" >&2
    echo "Run ./uninstall.sh first or remove the old symlink manually." >&2
    exit 1
  fi

  if [[ -e "$target_path" ]]; then
    echo "Refusing to replace existing path: $target_path" >&2
    echo "Remove it manually, then run ./install.sh again." >&2
    exit 1
  fi

  ln -s "$source_path" "$target_path"
  echo "Installed: $target_path -> $source_path"
done
