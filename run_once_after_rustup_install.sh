#!/bin/bash
set -euo pipefail
set -vx

# Install rustup, cargo, and rust nightly
if [[ ! -d ~/.cargo ]]; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --default-toolchain nightly
fi

if [[ ! -f ~/.cargo/bin/starship-jj ]]; then
  cargo install starship-jj --locked
fi
