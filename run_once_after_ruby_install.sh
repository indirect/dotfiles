#!/bin/bash
set -euo pipefail
set -vx

# Read the default ruby version out of ~/.zshrc
eval $(grep DEFAULT_RUBY_VERSION= zshrc)

# Load chruby into this shell if necessary
if [[ "$(type -w chruby)" != "chruby: function" ]]; then
  source ~/.zsh/chruby.zsh
fi

# Install the current default Ruby version if necessary
if [[ ! -d "$HOME/.rubies/ruby-$DEFAULT_RUBY_VERSION" ]]; then
  chruby install "$DEFAULT_RUBY_VERSION"
  chruby reload
fi
