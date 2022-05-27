#!/bin/bash
set -euo pipefail
set -vx

# don't spotlight index cache, rubies
paths=("$HOME/.cache" "$HOME/.rubies")
for p in ${paths[@]}; do
  mkdir -p "$p"
  chown "$USER:staff" "$p"
  touch "$p/.metadata_never_index"
done

# skip spotlight index on existing node_modules, bundled gems and rails assets
for pathname in ~/src/*/*/{.bundle/ruby,node_modules}; do
  touch "$pathname/.metadata_never_index"

  for railspath in tmp/cache public/assets public/packs public/packs-test; do
    railsdir="$pathname/../../$railspath" 
    if [[ -d "$railsdir" ]]; then
      touch "$railsdir/.metadata_never_index"
    fi
  done
done