#!/bin/bash
set -euo pipefail
set -vx

# this one, and only this one, is before for the sudo cache
sudo tmutil addexclusion -p /Applications/Xcode.app
