#!/bin/bash
set -euo pipefail
set -vx

files=(~/.local/LaunchDaemons/*)

for path in $files; do
  file="$(basename "$path")"
  target="/Library/LaunchDaemons/$file"
  sudo cp "$HOME/.local/LaunchDaemons/$file" "$target"
  sudo chown root:wheel "$target"
  sudo chmod 644 "$target"
done
