#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -vx

# Gotta get original ~/Downloads out of the way so we can symlink 
if test -d ~/Downloads && ! test -L ~/Downloads; then
  sudo mv ~/Downloads "$HOME/Downloads (Old)"
fi
