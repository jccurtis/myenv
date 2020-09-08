#!/bin/bash

mkdir -p ~/repos

# cd ~/repos
# if [[ ! -d "fonts" ]]; then
#     git clone https://github.com/powerline/fonts.git --depth=1 fonts
# fi
# ./fonts/install.sh

# Fonts
sudo apt install -y fonts-inconsolata

cd ~/repos
if [[ ! -d "nerd-fonts" ]]; then
    git clone https://github.com/ryanoasis/nerd-fonts.git
fi
cd nerd-fonts
git pull master
./install.sh SourceCodePro

sudo fc-cache -fv
