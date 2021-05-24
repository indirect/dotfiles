# set up homebrew
export BREW_PREFIX=$([[ "$(arch)" == "arm64" ]] && echo "/opt/homebrew" || echo "/usr/local")
[[ "$PATH" != "*$BREW_PREFIX/bin*" ]]  && export PATH="$BREW_PREFIX/bin:$PATH"
[[ "$PATH" != "*$BREW_PREFIX/sbin*" ]] && export PATH="$BREW_PREFIX/sbin:$PATH"

# disable this because it makes homebrew very slow
# export HOMEBREW_ONIVIM_SERIAL="$(security find-generic-password -s onivim2 -w)"
