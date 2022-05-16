# Use the current shell

set -e
set -u

_script=

if [[ "$(uname)" == 'Darwin' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        _script="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh"
    else
        _script="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
    fi
elif [[ "$(uname)" == 'Linux' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        _script="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"
    else
        _script="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
    fi
fi
if [ -z "$_script" ]; then
    echo "Cannot install miniconda on: $(uname -a)"
    exit 1
fi
echo "Downloading: $_script"
curl "$_script" --output $HOME/_conda_tmp.sh

bash $HOME/_conda_tmp.sh -b -p $HOME/miniconda
rm $HOME/_conda_tmp.sh

if [[ $SHELL == *zsh ]]; then
    $HOME/miniconda/bin/conda init zsh
elif [[ $SHELL == *bash ]]; then
    $HOME/miniconda/bin/conda init bash
else
    echo "Cannot init anaconda for this shell: $SHELL"
fi
