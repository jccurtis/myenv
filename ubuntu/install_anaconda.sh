#!/bin/env/bash

cd $HOME
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda
rm ~/anaconda.sh

printf "Appending to ~/.bash_profile ...\n"
printf "\n# Activate anaconda\nexport PATH=\"\$HOME/anaconda/bin:\$PATH\"\n" >> ~/.bash_profile

printf "Installing python packages ...\n"
conda install flake8 seaborn future
pip install lmfit progressbar2
