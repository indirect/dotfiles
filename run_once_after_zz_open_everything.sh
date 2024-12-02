#!/bin/bash
set -euo pipefail
set -vx

BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"

open_application() {
  local opened_dir="${HOME}/.local/state/chezmoi/opened"
  mkdir -p "${opened_dir}"
  local app_name="$1"
  local touched_file="${opened_dir}/${app_name}"
  local required_file="${2:-}"

  # Check if the optional file path is provided and if the file exists
  if [ -n "${required_file}" ] && [ ! -e "${required_file}" ]; then
    echo "Skipping opening ${app_name} because the file at ${required_file} does not exist."
  elif [ ! -e "/Applications/${app_name}.app" ]; then
    echo "Skipping ${app_name} because it is not in /Applications."
  elif [ -e "${touched_file}" ]; then
    echo "${app_name} was already opened."
  else
    open -a "${app_name}"
    touch "${touched_file}"
    echo "Opened ${app_name} and touched ${touched_file}."
  fi
}

open_application "$(echo $BREW_PREFIX/Caskroom/backblaze/*/*\ Installer.app)", "/Library/PreferencePanes/Backblaze Settings Launcher.prefPane"
open_application "Little Snitch", 
open_application "Alfred 5"
open_application "Bartender 5"
open_application "Maestral"
open_application "Due"
open_application "Hammerspoon"
open_application "Karabiner-Elements"
open_application "Keyboard Maestro"
open_application "Rectangle Pro"
open_application "Tailscale"
open_application "Xcode"
open_application "Stats"
