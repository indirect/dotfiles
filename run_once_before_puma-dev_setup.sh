#!/bin/bash
set -euo pipefail
set -vx

sudo puma-dev -setup
puma-dev -install
