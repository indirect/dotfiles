#!/bin/bash
set -euo pipefail
set -vx

# Remap (internal, at least) capslock to control. Really.
# hidutil & values from https://developer.apple.com/library/archive/technotes/tn2450/_index.html
#   (via https://dchakarov.com/blog/macbook-remap-keys/)

caps_lock="30064771129" # 0x700000039
left_ctrl="30064771300" # 0x7000000E0

# remap all keyboards, immediately (will expire on logout)
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":'"$caps_lock"',"HIDKeyboardModifierMappingDst":'"$left_ctrl"'}]}'

# configure remap for future logins (settings are per-vendor/product ID, applied by the OS)
function remap() {
  defaults -currentHost write -g "com.apple.keyboard.modifiermapping.$1" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>$left_ctrl</integer><key>HIDKeyboardModifierMappingSrc</key><integer>$caps_lock</integer></dict>"
}

# get internal keyboard product-vendor IDs
keyboard_ids="$(ioreg -c AppleHSSPIInterface -r | grep -E 'idVendor|idProduct' | awk '{print $4}' | tac | paste -s -d '-\n' - | sort | uniq | awk '{print $1"-0"}')"
for id in $keyboard_ids; do
  remap $id
done

# found via `defaults -currentHost read | head -n25` after remapping in Keyboard.prefpane
magic_keyboard_id="alt_handler_id-49"
remap $magic_keyboard_id
