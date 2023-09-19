#!/bin/bash
set -euo pipefail
set -vx

sudo puma-dev -setup
{{ if .server }}
puma-dev -install
{{ else }}
puma-dev -install -install-port 9280 -install-https-port 9283
{{ end }}
