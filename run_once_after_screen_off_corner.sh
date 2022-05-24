#!/bin/bash
set -euo pipefail
set -vx

# Set up bottom-left corner to sleep display
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0
