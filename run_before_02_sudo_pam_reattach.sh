#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -vx

Q="-q"
BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"
PAM_REATTACH="$BREW_PREFIX/lib/pam/pam_reattach.so"
test -e "$PAM_REATTACH" || brew install pam_reattach

echo "Configuring sudo with pam_reattach:"
PAM_FILE="/etc/pam.d/sudo"
FIRST_LINE="# sudo: auth account password session"

if grep $Q pam_reattach.so "$PAM_FILE"; then
  echo "Already set up"
elif ! head -n1 "$PAM_FILE" | grep $Q "$FIRST_LINE"; then
  echo "$PAM_FILE is not in the expected format!"
else
  TOUCHID_LINE="auth       optional       $PAM_REATTACH"
  sudo sed -i.bak -e \
    "s|$FIRST_LINE|$FIRST_LINE\n$TOUCHID_LINE|" \
    "$PAM_FILE"
  sudo rm "$PAM_FILE.bak"
  echo "Done"
fi
