#!/bin/bash
set -euo pipefail

Q="-q"
PAM_FILE="/etc/pam.d/sudo"
FIRST_LINE="# sudo: auth account password session"

add_pam_line() {
  TOUCHID_LINE="$1"

  if grep $Q "$TOUCHID_LINE" "$PAM_FILE"; then
    return 0
  fi

  if ! head -n1 "$PAM_FILE" | grep $Q "$FIRST_LINE"; then
    echo "$PAM_FILE is not in the expected format!"
  else
    sudo sed -i.bak -e \
      "s|$FIRST_LINE|$FIRST_LINE\n$TOUCHID_LINE|" \
      "$PAM_FILE"
    sudo rm "$PAM_FILE.bak"
  fi
}

add_pam_line "auth       sufficient     pam_tid.so"

BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"
PAM_REATTACH="$BREW_PREFIX/lib/pam/pam_reattach.so"
test -e "$PAM_REATTACH" || brew install pam-reattach
add_pam_line "auth       optional       $PAM_REATTACH"
