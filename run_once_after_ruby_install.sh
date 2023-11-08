#!/bin/zsh -li
# set -euo pipefail
set -vx

# Read the default ruby version out of ~/.zshrc
eval "$(grep DEFAULT_RUBY_VERSION= ~/.zshrc)"

# Install the current default Ruby version if necessary
if [[ ! -d "$HOME/.rubies/ruby-$DEFAULT_RUBY_VERSION" ]]; then
  chruby install "$DEFAULT_RUBY_VERSION" -- --with-openssl-dir="$(brew --prefix openssl@1.1)"
  chruby reload
fi
