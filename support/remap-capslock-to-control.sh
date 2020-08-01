#!/bin/bash
# Remap capslock to control. Really.
#
# list of keyboards plugged in to this computer
keyboard_ids=$(ioreg -c AppleHSSPIInterface -r | grep -E 'idVendor|idProduct' | awk '{print $4}' | paste -s -d'-\n' -)
echo $keyboard_ids

# check if the keyboards are already remapped
echo $keyboard_ids | xargs -I{} sh -c 'defaults -currentHost read -g "com.apple.keyboard.modifiermapping.{}-0" | grep "Dst = 2" > /dev/null'

exit 0
if [[ $? -ne 0 ]]; then
  # remap the keyboards
  echo $keyboard_ids | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"
fi
