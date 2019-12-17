#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
env_script_user="${HOME}/.zshrc"
env_script_src="${this_dir}/zshrc.custom"
env_script_dest="${env_script_user}.custom"

if [[ -f $env_script_dest ]]; then
    echo "Removing: ${env_script_dest}"
fi

echo "Symlinking: ${env_script_dest} -> ${env_script_src}"
ln -sf $env_script_src $env_script_dest

source_env="source ${env_script_dest}"

if grep -Fxq "${source_env}" "${env_script_user}"; then
    # line found
    echo "Found ${source_env} in ${env_script_user}"
else
    # line not found
    echo "Appending ${source_env} to ${v}"
    echo "${source_env}" >> $env_script_user
fi
