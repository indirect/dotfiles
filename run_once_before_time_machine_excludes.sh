#!/bin/bash
set -euo pipefail
set -vx

# don't back up dropbox, steam games
sudo tmutil addexclusion -p \
  /Applications/Xcode.app \
  "$HOME/Dropbox" \
  "$HOME/Dropbox (Personal)" \
  "$HOME/Dropbox (Cloud City)" \
  "$HOME/Library/Application Support/Steam/steamapps"

# skip backup on node_modules, bundled gems and rails assets
pathnames=(~/src/*/*/{.bundle/ruby,node_modules})
if (find "$pathnames" 2>&1 1>/dev/null); then
  for pathname in $pathnames; do
    sudo tmutil addexclusion "$pathname"

    for railspath in tmp/cache public/assets public/packs public/packs-test; do
      railsdir="$pathname/../../$railspath" 
      if [[ -d "$railsdir" ]]; then
        sudo tmutil addexclusion "$railsdir"
      fi
    done
  done
fi
