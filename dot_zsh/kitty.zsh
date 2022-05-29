if test -n "$KITTY_INSTALLATION_DIR"; then
  alias ssh="kitty +kitten ssh"

  if test -d "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
  fi
fi
