#!/bin/bash
set -euo pipefail
set -vx

BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"

if [[ ! -d /Library/PreferencePanes/BackblazeBackup.prefPane ]]; then
    open -a "$BREW_PREFIX/Caskroom/backblaze/*/*.app"
fi

open -a "Alfred 4"
open -a "Bartender 4"
open -a "Dropbox"
open -a "Due"
open -a "Hammerspoon"
open -a "Karabiner-Elements"
open -a "Keyboard Maestro"
open -a "Little Snitch"
open -a "MenuMeters"
open -a "Rectangle Pro"
