#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if grep -q pam_reattach.so /etc/pam.d/sudo; then
  exit 0
fi

Q="-q"
BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"
PAM_REATTACH="$BREW_PREFIX/lib/pam/pam_reattach.so"
PAM_FILE="/etc/pam.d/sudo"
FIRST_LINE="# sudo: auth account password session"
TOUCHID_LINE="auth       optional       $PAM_REATTACH"

set -vx
test -e "$PAM_REATTACH" || brew install pam_reattach
echo "Configuring sudo with pam_reattach:"

if grep $Q pam_reattach.so "$PAM_FILE"; then
  echo "Already set up"
elif ! head -n1 "$PAM_FILE" | grep $Q "$FIRST_LINE"; then
  echo "$PAM_FILE is not in the expected format!"
else
  sudo sed -i.bak -e \
    "s|$FIRST_LINE|$FIRST_LINE\n$TOUCHID_LINE|" \
    "$PAM_FILE"
  sudo rm "$PAM_FILE.bak"
  echo "Done"
fi
