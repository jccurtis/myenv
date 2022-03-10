# Use the current shell

set +e
set +u

if [[ "$(uname)" == 'Darwin' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -O ~/_conda_tmp.sh
    else
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/_conda_tmp.sh
    fi
elif [[ "$(uname)" == 'Linux' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/_conda_tmp.sh
    else
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/_conda_tmp.sh
    fi
fi

bash ~/_conda_tmp.sh -b -p $HOME/miniconda
rm ~/_conda_tmp.sh

if [[ $SHELL == *zsh ]]; then
    ~/miniconda/bin/conda init zsh
elif [[ $SHELL == *bash ]]; then
    ~/miniconda/bin/conda init bash
else
    echo "Cannot init anaconda for this shell: $SHELL"
fi
