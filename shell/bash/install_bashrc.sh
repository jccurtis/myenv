#!/usr/bin/env bash

# get paths
this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
env_script_src="${this_dir}/bashrc.sh"
env_script_dest="${HOME}/.bashrc_custom.sh"

if [ -f $env_script_dest ]; then
    echo "Removing old: ${env_script_dest}"
    rm $env_script_dest
fi

echo "Symlinking: ${env_script_dest} -> ${env_script_src}"
ln -sf $env_script_src $env_script_dest

# Add to bashrc if needed
if [ -f $HOME/.bashrc ]; then
    bashrc="$HOME/.bashrc"
else
    bashrc="$HOME/.bash_profile"
fi

source_env="source ${env_script_dest}"
if grep -Fxq "${source_env}" "${bashrc}"; then
    # line found
    echo "Found ${source_env} in ${bashrc}"
else
    # line not found
    echo "Appending ${source_env} to ${bashrc}"
    echo "${source_env}" >> $bashrc
fi
