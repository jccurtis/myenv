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

clone_it() {
    local remote=$1
    local dest=$2
    local branch=$3
    if [[ ! -d $dest ]]; then
        git clone $remote $dest
    fi
    cd $dest
    git checkout $branch
    git pull
}

symlink_it "${this_dir}/jccurtis.zsh" "${HOME}/.jccurtis.zsh"
append_line "[[ ! -f ~/.jccurtis.zsh ]] || source ~/.jccurtis.zsh" $zshrc

echo "Source ${zshrc}"
# . $zshrc

echo "Install tmux mods"

clone_it "https://github.com/gpakosz/.tmux.git" $HOME/.oh-my-tmux master
cd $HOME
rm_safe .tmux.conf
ln -s -f .oh-my-tmux/.tmux.conf
rm_safe .tmux.conf.local
ln -s -f ${this_dir}/tmux.conf.local .tmux.conf.local
cd $this_dir

echo "Installing zsh mods"

symlink_it "${this_dir}/p10k.zsh" "${HOME}/.p10k.zsh"
append_line "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" $zshrc

clone_it "https://github.com/romkatv/powerlevel10k.git" $HOME/.oh-my-zsh/custom/themes/powerlevel10k master
clone_it "https://github.com/esc/conda-zsh-completion.git" $HOME/.oh-my-zsh/custom/plugins/conda-zsh-completion master
clone_it "https://github.com/zsh-users/zsh-completions.git" $HOME/.oh-my-zsh/custom/plugins/zsh-completions master

# Add upgrade line
append_line '[[ ! -f ${UNIX_SETUP_REPO}/zsh/check_for_upgrade.zsh ]] || zsh ${UNIX_SETUP_REPO}/zsh/check_for_upgrade.zsh' $zshrc

echo "Restart your terminal for the changes to take effect ..."

set +e
