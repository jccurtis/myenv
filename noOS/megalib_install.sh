#!/bin/env/bash

# https://github.com/zoglauer/megalib

cd ~
git clone https://github.com/zoglauer/megalib
cd megalib
bash setup.sh --release=dev --patch=yes --clean=yes

printf "Appending to ~/.bash_profile\n"
printf "\n# Activate MEGAlib\n. ~/megalib/bin/source-megalib.sh\n" >> ~/.bash_profile
