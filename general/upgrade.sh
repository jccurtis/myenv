
# Adapted from oh-my-zsh/tools/upgrade.sh

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

cd "$UPGRADE_REPO"

# Set git-config values known to fix git errors
# Line endings (#4069)
git config core.eol lf
git config core.autocrlf false
# zeroPaddedFilemode fsck errors (#4963)
git config fsck.zeroPaddedFilemode ignore
git config fetch.fsck.zeroPaddedFilemode ignore
git config receive.fsck.zeroPaddedFilemode ignore

printf "${BLUE}%s${NORMAL}\n" "Updating ${UPGRADE_REPO} from:"
printf "${BLUE}%s${NORMAL}\n" "$(git remote -v)"
if git pull --rebase --stat origin master
then
  printf '%s' "$GREEN"
  printf "${BLUE}%s\n" "Hooray! ${UPGRADE_REPO} has been updated and/or is at the current version."
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later!'
fi
