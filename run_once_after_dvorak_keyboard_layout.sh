#!/bin/bash
set -euo pipefail
set -vx

# add dvorak to keyboard layouts
defaults import com.apple.HIToolbox ~/.dotfiles/support/defaults/com.apple.HIToolbox.plist
