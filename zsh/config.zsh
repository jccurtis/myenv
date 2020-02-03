#!/bin/zsh

this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
zshrc="${HOME}/.zshrc"

echo "Installing Oh My Zsh!"
#   CHSH    - 'no' means the installer will not change the default shell (default: yes)
#   RUNZSH  - 'no' means the installer will not run zsh after the install (default: yes)
export CHSH="no"
export RUNZSH="no"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Exit on error
set -e

rm_safe() {
    local target="${1}"
    if [[ -h $target ]]; then
        echo "Removing symlink: ${target}"
        rm $target
    elif [[ -f $target ]]; then
        echo "Backing up: ${target}->${target}.backup"
        if [[ -f "${target}.backup" ]]; then
            echo "Removing: ${target}.backup"
            rm -f "${target}.backup"
        fi
        mv "${target}" "${target}.backup"
    fi
}

symlink_it() {
    local src="${1}"
    local dest="${2}"
    rm_safe $dest
    echo "Symlinking: ${dest} -> ${src}"
    ln -sf $src $dest
}

append_line() {
    local line="${1}"
    local dest="${2}"
    if grep -Fxq "${line}" "${dest}"; then
        # line found
        echo "Found ${line} in ${dest}"
    else
        # line not found
        echo "Appending ${line} to ${dest}"
        echo "${line}" >> $dest
    fi
}

symlink_it "${this_dir}/jccurtis.zsh" "${HOME}/.jccurtis.zsh"
append_line "[[ ! -f ~/.jccurtis.zsh ]] || source ~/.jccurtis.zsh" $zshrc

echo "Source ${zshrc}"
# . $zshrc

symlink_it "${this_dir}/p10k.zsh" "${HOME}/.p10k.zsh"
append_line "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" $zshrc

if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi
cd $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git checkout master
git pull

# Add upgrade line
append_line '[[ ! -f ${UNIX_SETUP_REPO}/general/check_for_upgrade.zsh ]] || zsh ${UNIX_SETUP_REPO}/general/check_for_upgrade.zsh' $zshrc

echo "Restart your terminal for the changes to take effect ..."

set +e
