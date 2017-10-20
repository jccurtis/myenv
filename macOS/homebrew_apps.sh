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
    ssh-cop-id \
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
    filezilla \
    firefox \
    flux \
    github-desktop \
    google-chrome \
    #google-hangouts \
    iterm2 \
    mactex \
    odrive \
    onyx \
    pdfexpert \
    plain-clip \
    skype \
    spotify \
    sublime-text \
    vlc \
    xquartz

echo "chown-ing the texlive install so tlmgr will work"
sudo chown -R whoami /usr/local/texlive/

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
brew cask cleanup
