#!/bin/env/bash

# -------------------------------------
# Install Tools
# -------------------------------------

tools=(
  autoconf
  automake
  ack
  cmake
  curl
  git
  mas
  openssl
  psgrep
  shellcheck
  ssh-copy-id
  wget
)

echo "installing tools..."
brew install ${tools[@]}

# -------------------------------------
# Install apps to: /Applications
# Default is:      $HOME/Applications
# -------------------------------------

apps=(
  appcleaner
  atom
  filezilla
  firefox
  flux
  github-desktop
  google-chrome
  #google-hangouts
  iterm2
  mactex
  odrive
  pdfexpert
  plain-clip
  skype
  spotify
  sublime-text
  vlc
  xquartz
)

echo "Installing Apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "chown-ing the tezlive install so tlmgr will work"
sudo chown -R whoami /usr/local/texlive/

# -------------------------------------
# Install Fonts
# -------------------------------------

fonts=(
  font-monoid
  font-source-code-pro
  font-source-code-pro-for-powerline
  font-open-sans
  font-inconsolata
)

echo "Installing Fonts..."
brew cask install ${fonts[@]}#!/bin/sh


# -------------------------------------
# Cleanup
# -------------------------------------

echo "Cleaning up cask downloads..."
brew cask cleanup
