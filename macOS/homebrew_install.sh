#!/bin/sh

# -------------------------------------
# Install Homebrew
# -------------------------------------

echo “Installing Homebrew...”
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# -------------------------------------
# Tapping cask versions
# -------------------------------------

brew tap caskroom/versions
brew tap caskroom/fonts
