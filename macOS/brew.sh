brew analytics off
brew update
brew bundle --verbose

# Cleanup zsh-autocompletions
rm -f ~/.zcompdump
compinit
chmod go-w '/usr/local/share'
