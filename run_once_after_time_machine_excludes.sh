#!/bin/bash
set -euo pipefail
set -vx

# don't back up dropbox, steam games
tmutil addexclusion -p \
  "$HOME/Dropbox" \
  "$HOME/Dropbox (Personal)" \
  "$HOME/Dropbox (Cloud City)" \
  "$HOME/Library/Application Support/Steam/steamapps"

# skip backup on node_modules, bundled gems and rails assets
for pathname in ~/src/*/*/{.bundle/ruby,node_modules}; do
  tmutil addexclusion "$pathname"

  for railspath in tmp/cache public/assets public/packs public/packs-test; do
    railsdir="$pathname/../../$railspath" 
    if [[ -d "$railsdir" ]]; then
      tmutil addexclusion "$railsdir"
    fi
  done
done
