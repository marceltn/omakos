#!/bin/bash

# Source utility functions
source ./scripts/utils.sh

# Set macOS preferences
step "Customizing macOS system preferences..."

# Keyboard settings
step "Setting faster keyboard repeat rates..."
defaults write -g InitialKeyRepeat -int 25 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2         # normal minimum is 2 (30 ms)
defaults write -g ApplePressAndHoldEnabled -bool false # disable character picker
print_success_muted "Keyboard repeat rates configured"

# Finder preferences
step "Showing hidden files and file extensions in Finder..."
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
print_success_muted "Finder preferences configured"

# Text and input preferences
step "Disabling automatic text corrections and substitutions..."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
print_success_muted "Text input preferences configured"

# Save and print dialogs
step "Expanding save and print dialogs by default..."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
print_success_muted "Save and print dialogs configured"

# Screenshot settings
step "Setting PNG as default screenshot format..."
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture "include-date" -bool "true"
print_success_muted "Screenshot settings configured"

# .DS_Store settings
step "Preventing .DS_Store file creation on network and USB volumes..."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
print_success_muted ".DS_Store settings configured"

# Dock settings
step "Removing Dock animation delays and clearing default apps..."
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0
defaults write com.apple.dock springboard-page-duration -int 0
defaults write com.apple.dock persistent-apps -array
print_success_muted "Dock preferences configured"

# Disable Apple Intelligence
step "Disabling Apple Intelligence..."
defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"
print_success_muted "Apple Intelligence disabled"

# Restart affected applications
step "Applying changes by restarting Finder and Dock..."
killall Dock
killall Finder
print_success_muted "Applications restarted"

echo ""
print_success "macOS settings have been updated successfully!"
