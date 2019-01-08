#!/bin/env/bash

# -------------------------------------
# Install Tools
# -------------------------------------

echo "installing tools..."
brew install \
    autoconf \
    automake \
    ack \
    cmake \
    curl \
    docker \
    git \
    mas \
    openssl \
    pandoc \
    psgrep \
    rsync \
    shellcheck \
    ssh-copy-id \
    wget

# -------------------------------------
# Install apps to: /Applications
# Default is:      $HOME/Applications
# -------------------------------------

echo "Installing Apps..."
brew cask install --appdir="/Applications" \
    adobe-creative-cloud \
    appcleaner \
    atom \
    cyberduck \
    firefox \
    flux \
    github \
    google-chrome \
    #google-hangouts \
    iterm2 \
    mactex \
    mendeley \
    odrive \
    onyx \
    pdfexpert \
    plain-clip \
    skype \
    spotify \
    sublime-text \
    visual-studio-code \
    vlc \
    xquartz

echo "chown-ing the texlive install so tlmgr will work"
sudo chown -R $(whoami) /usr/local/texlive/

# -------------------------------------
# Install Fonts
# -------------------------------------

echo "Installing Fonts..."
brew cask install \
    font-monoid \
    font-source-code-pro \
    font-source-code-pro-for-powerline \
    font-open-sans \
    font-inconsolata \
    font-inconsolata-for-powerline

# -------------------------------------
# Cleanup
# -------------------------------------

echo "Cleaning up cask downloads..."
brew cleanup
