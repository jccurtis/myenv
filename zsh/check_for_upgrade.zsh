#!/usr/bin/env zsh
# Adapted from oh-my-zsh/tools/check_for_upgrade.sh

zmodload zsh/datetime

last_update_path="${UNIX_SETUP_REPO}/.last-update"
update_lock_dir="${UNIX_SETUP_REPO}/.lock-update"
update_days=1

function _current_epoch() {
  echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _bump_update() {
  echo "LAST_EPOCH_DAYS=$(_current_epoch)" >! ${last_update_path}
}

function _upgrade() {
  env UPGRADE_REPO=$UNIX_SETUP_REPO sh $UNIX_SETUP_REPO/general/upgrade.sh
  env UPGRADE_REPO=$ZSH/custom/themes/powerlevel10k sh $UNIX_SETUP_REPO/general/upgrade.sh
  env UPGRADE_REPO=$ZSH/custom/plugins/conda-zsh-completion sh $UNIX_SETUP_REPO/general/upgrade.sh
  env UPGRADE_REPO=$HOME/.oh-my-tmux sh $UNIX_SETUP_REPO/general/upgrade.sh
  _bump_update
}

# Cancel upgrade if the current user doesn't have write permissions
[[ -w "$UNIX_SETUP_REPO" ]] || return 0

# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || return 0

if mkdir "${update_lock_dir}" 2>/dev/null; then
  if [ -f ${last_update_path} ]; then
    source ${last_update_path}

    if [[ -z "$LAST_EPOCH_DAYS" ]]; then
      _bump_update
      rmdir ${update_lock_dir}
      return 0
    fi

    epoch_diff=$(($(_current_epoch) - $LAST_EPOCH_DAYS))
    if [ $epoch_diff -gt $update_days ]; then
      if [ "$DISABLE_UPDATE_PROMPT" = "true" ]; then
        _upgrade
      else
        echo "[UNIX SETUP] Attempting update!"
        _upgrade
      fi
    fi
  else
    # create the zsh file
    _bump_update
  fi

  rmdir ${update_lock_dir}
fi
