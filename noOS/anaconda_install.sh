#!/bin/bash

if [[ "$(uname)" == 'Darwin' ]]; then
    wget https://repo.anaconda.com/archive/Anaconda3-2019.10-MacOSX-x86_64.sh -O ~/anaconda_tmp.sh
elif [[ "$(uname)" == 'Linux' ]]; then
    wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda_tmp.sh
fi

bash ~/anaconda_tmp.sh -b -p $HOME/anaconda
rm ~/anaconda_tmp.sh

if [[ $SHELL== *zsh ]]; then
    ~/anaconda/bin/conda init zsh
elif [[ $SHELL== *bash ]]; then
    ~/anaconda/bin/conda init bash
else
    echo "Cannot init anaconda for this shell: $SHELL"
fi
