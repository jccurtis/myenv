#!/bin/bash

brew analytics off
brew update
brew bundle --verbose

# Cleanup zsh-autocompletions
rm -f ~/.zcompdump
compinit
chmod go-w '/usr/local/share'

# Cleanup
brew cleanup

# Change texlive installation owner so tlmgr will work
sudo chown -R $(whoami) /usr/local/texlive/
