#!/bin/bash
set -vx

# Remap capslock to control. Really.
#
# list of keyboards plugged in to this computer
keyboard_ids=$(ioreg -c AppleHSSPIInterface -r | grep -E 'idVendor|idProduct' | awk '{print $4}' | tac | paste -s -d '-\n' - | sort | uniq)

# check if the keyboards are already remapped
echo $keyboard_ids | xargs -I{} sh -c 'defaults -currentHost read -g "com.apple.keyboard.modifiermapping.{}-0" | grep "Dst = 30064771300" > /dev/null'

if [[ $? -ne 0 ]]; then
  # remap the keyboards
  echo $keyboard_ids | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771300</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer></dict>"
fi

mapping=$(hidutil property --get "UserKeyMapping")
if [[ "$mapping" == "(null)" ]]; then
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'
fi
