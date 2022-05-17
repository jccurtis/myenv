# Use the current shell

set -e
set -u

_script=

if [[ "$(uname)" == 'Darwin' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        _script="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-arm64.sh"
    else
        _script="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-x86_64.sh"
    fi
elif [[ "$(uname)" == 'Linux' ]]; then
    if [[ `uname -m` == 'arm64' ]]; then
        _script="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-aarch64.sh"
    else
        _script="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
    fi
fi
if [ -z "$_script" ]; then
    echo "Cannot install miniconda on: $(uname -a)"
    exit 1
fi
echo "Downloading: $_script"
curl "$_script" --output $HOME/_tmp.sh

bash $HOME/_tmp.sh -b
rm $HOME/_tmp.sh

if [[ $SHELL == *zsh ]]; then
    $HOME/mambaforge/bin/conda init zsh
elif [[ $SHELL == *bash ]]; then
    $HOME/mambaforge/bin/conda init bash
else
    echo "Cannot init anaconda for this shell: ${SHELL}"
fi
