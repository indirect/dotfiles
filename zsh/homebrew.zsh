# set up homebrew
export BREW_PREFIX=$([[ "$(arch)" == "arm64" ]] && echo "/opt/homebrew" || echo "/usr/local")
[[ "$PATH" != "*$BREW_PREFIX/bin*" ]] && export PATH="$BREW_PREFIX/bin:$PATH"

export HOMEBREW_ONIVIM_SERIAL="$(security find-generic-password -s onivim2 -w)"
