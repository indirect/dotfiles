#!/bin/bash
set -euo pipefail
set -vx

# Install Terminal theme
THEME=$(cat "$HOME/.dotfiles/support/terminal/Solarized Dark Menlo NF.terminal")
plutil -replace "Window Settings.Solarized Dark" -xml "$THEME" \
  ~/Library/Preferences/com.apple.Terminal.plist
defaults write com.apple.Terminal "Default Window Settings" -string "Solarized Dark"
defaults write com.apple.Terminal "Startup Window Settings" -string "Solarized Dark"
