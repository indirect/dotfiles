#!/bin/bash
set -euo pipefail
set -vx

dockutil --no-restart --remove all

dockutil --no-restart --add /System/Applications/System\ Preferences.app
dockutil --no-restart --add /Applications/Safari.app
dockutil --no-restart --add /System/Applications/Messages.app
dockutil --no-restart --add /System/Applications/Mail.app
dockutil --no-restart --add /Applications/Slack.app
dockutil --no-restart --add /System/Applications/Music.app
dockutil --no-restart --add /Applications/Fantastical.app
dockutil --no-restart --add /Applications/kitty.app
dockutil --no-restart --add /System/Library/CoreServices/Applications/Feedback\ Assistant.app

dockutil --add ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Downloads --view fan --display stack
