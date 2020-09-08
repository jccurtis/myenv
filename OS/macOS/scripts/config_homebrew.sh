#!/bin/bash

this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
cd $this_dir

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
if [[ -d /usr/local/texlive/ ]]; then
    sudo chown -R $(whoami) /usr/local/texlive/
fi
