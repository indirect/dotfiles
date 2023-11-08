#!/bin/bash
set -euo pipefail
set -vx

# don't spotlight index cache, rubies
paths=(
  "$HOME/.cache"
  "$HOME/.rubies"
  "$HOME/Library/Application Support/Steam/steamapps"
)
for p in ${paths[@]}; do
  mkdir -p "$p"
  chown "$USER:staff" "$p"
  touch "$p/.metadata_never_index"
done

# skip spotlight index on existing node_modules, bundled gems and rails assets
pathnames=(~/src/*/*/{.bundle/ruby,node_modules})
if (find "$pathnames"); then
  for pathname in $pathnames; do
    touch "$pathname/.metadata_never_index"

    for railspath in tmp/cache public/assets public/packs public/packs-test; do
      railsdir="$pathname/../../$railspath" 
      if [[ -d "$railsdir" ]]; then
        touch "$railsdir/.metadata_never_index"
      fi
    done
  done
fi
