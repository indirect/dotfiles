#!/bin/bash
set -euo pipefail
set -vx

echo "You need to use Keychain Access to copy the 'bpb key' keychain entry from iCloud to your login keychain."
echo "When you're done, come back and push enter."
read

# Verify bpb is working
bpb print | gpg --import

# Trust the key so we can verify commits locally
echo $(gpg --list-keys --fingerprint | grep "andre@arko.net" -B 1 | head -1 | tr -d '[:space:]'):6: | gpg --import-ownertrust
