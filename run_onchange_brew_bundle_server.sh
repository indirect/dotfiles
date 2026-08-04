#!/bin/bash
set -euo pipefail
set -vx

# {{ include "dot_Brewfile.server" | sha256sum }}
brew bundle check --file ~/.Brewfile.server --no-upgrade || brew bundle install --file ~/.Brewfile.server --no-upgrade
