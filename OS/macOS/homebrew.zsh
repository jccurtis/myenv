#!/bin/zsh

this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
cd $this_dir

which -s brew;
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
fi

brew analytics off

cd $this_dir/assets
brew bundle --verbose
cd $this_dir

# Cleanup zsh-autocompletions
rm -f ~/.zcompdump
autoload -Uz compinit && compinit
chmod go-w '/usr/local/share'

# Cleanup
brew cleanup

# Change texlive installation owner so tlmgr will work
if [[ -d /usr/local/texlive/ ]]; then
    sudo chown -R $(whoami) /usr/local/texlive/
fi
