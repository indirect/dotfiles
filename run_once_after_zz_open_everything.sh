#!/bin/bash
set -euo pipefail
set -vx

BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"

if [[ ! -d /Library/PreferencePanes/Backblaze\ Settings\ Launcher.prefPane ]]; then
  open "$(echo $BREW_PREFIX/Caskroom/backblaze/*/*Installer.app)"
fi

test -e "/Applications/Little Snitch.app" && open -a "Little Snitch"

open -a "Alfred 5"
open -a "Bartender 5"
open -a "Maestral"
open -a "Due"
open -a "Hammerspoon"
open -a "Karabiner-Elements"
open -a "Keyboard Maestro"
open -a "Rectangle Pro"
open -a "Tailscale"
