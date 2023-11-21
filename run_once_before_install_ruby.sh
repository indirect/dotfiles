#!/bin/bash
set -euo pipefail

ruby-install --cleanup --no-reinstall ruby -- --with-openssl-dir=$(brew --prefix openssl@3)
