#!/bin/bash
set -euo pipefail
# set -vx

# Flash the screen when a beep is played
defaults write -g "com.apple.sound.beep.flash" -int 1

# Don't play sounds while adjusting the volume
defaults write -g "com.apple.sound.beep.feedback" -int 0

# Show ~/Library
chflags nohidden ~/Library

# Disable holding a key for the special character menu
defaults write -g ApplePressAndHoldEnabled -bool false

# Make keys repeat really fast
defaults write -g KeyRepeat -int 1

# Show external volumes on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Set up bottom-left corner to sleep display
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# enable ssh logins
systemsetup -setremotelogin on &>/dev/null

# enable ntp
systemsetup -setusingnetworktime on &>/dev/null

# restart on power failure
systemsetup -setrestartpowerfailure on &>/dev/null

# restart on freeze
systemsetup -setrestartfreeze on &>/dev/null

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari ShowOverlayStatusBar -bool true
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Safari opens with: last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# Website use of location services
# 0 = Deny without prompting
# 1 = Prompt for each website once each day
# 2 = Prompt for each website one time only
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 2

# disable Xcode Cloud upsell
defaults write com.apple.dt.Xcode XcodeCloudUpsellPromptEnabled -bool false

# Disable "removing from iCloud Drive" warnings
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Set Mail.app fonts
defaults write com.apple.mail NSFont -string "AvenirNext-Regular"
defaults write com.apple.mail NSFontSize -int 14
defaults write com.apple.mail NSFixedPitchFont -string "Menlo-Regular"
defaults write com.apple.mail NSFixedPitchFontSize -int 13
