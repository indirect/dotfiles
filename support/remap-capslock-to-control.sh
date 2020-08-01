#!/bin/bash

# Remap (internal, at least) capslock to control. Really.
# hidutil & values from https://developer.apple.com/library/archive/technotes/tn2450/_index.html
#   (via https://dchakarov.com/blog/macbook-remap-keys/)

caps_lock="30064771129" # 0x700000039
left_ctrl="30064771300" # 0x7000000E0

set -vx
# remap immediately (will expire on logout)
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":'"$caps_lock"',"HIDKeyboardModifierMappingDst":'"$left_ctrl"'}]}'
set +vx

# configure remap for future logins (settings are per-vendor/product ID, applied by the OS)
keyboard_ids=$(ioreg -c AppleHSSPIInterface -r | grep -E 'idVendor|idProduct' | awk '{print $4}' | tac | paste -s -d '-\n' - | sort | uniq)
set -vx
echo $keyboard_ids | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>$left_ctrl</integer><key>HIDKeyboardModifierMappingSrc</key><integer>$caps_lock</integer></dict>"
