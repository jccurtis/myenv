#!/bin/env/bash

wget https://repo.continuum.io/archive/Anaconda3-4.3.0-MacOSX-x86_64.sh -O ~/anaconda_tmp.sh
bash ~/anaconda_tmp.sh -b -p $HOME/anaconda
rm ~/anaconda_tmp.sh

printf "Appending to ~/.bash_profile\n"
printf "\n# Activate anaconda\nsource $HOME/anaconda/bin/activate\n" >> ~/.bash_profile
