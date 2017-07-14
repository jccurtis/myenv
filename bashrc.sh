#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# show git repo status after username + colors!
# -----------------------------------------------------------------------------
# bash prompt coloring from http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
# http://martinvalasek.com/blog/current-git-branch-name-in-command-prompt
# https://gist.github.com/chrisopedia/8754917
# export PS1="\033[36m\u\033[m@\033[32m\h:\033[33;1m\w\033[m\$ "
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
MAGENTA="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"
BOLD_BLACK="\e[1;30m"
BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_MAGENTA="\e[1;35m"
BOLD_CYAN="\e[1;36m"
BOLD_WHITE="\e[1;37m"
UNDERLINE_BLACK="\e[4;30m"
UNDERLINE_RED="\e[4;31m"
UNDERLINE_GREEN="\e[4;32m"
UNDERLINE_YELLOW="\e[4;33m"
UNDERLINE_BLUE="\e[4;34m"
UNDERLINE_MAGENTA="\e[4;35m"
UNDERLINE_CYAN="\e[4;36m"
UNDERLINE_WHITE="\e[4;37m"
BRIGHT_BLACK="\e[0;90m"
BRIGHT_RED="\e[0;91m"
BRIGHT_GREEN="\e[0;92m"
BRIGHT_YELLOW="\e[0;93m"
BRIGHT_BLUE="\e[0;94m"
BRIGHT_MAGENTA="\e[0;95m"
BRIGHT_CYAN="\e[0;96m"
BRIGHT_WHITE="\e[0;97m"
BRIGHT_BOLD_BLACK="\e[1;90m"
BRIGHT_BOLD_RED="\e[1;91m"
BRIGHT_BOLD_GREEN="\e[1;92m"
BRIGHT_BOLD_YELLOW="\e[1;93m"
BRIGHT_BOLD_BLUE="\e[1;94m"
BRIGHT_BOLD_MAGENTA="\e[1;95m"
BRIGHT_BOLD_CYAN="\e[1;96m"
BRIGHT_BOLD_WHITE="\e[1;97m"
BACKGROUND_BLACK="\e[40m"
BACKGROUND_RED="\e[41m"
BACKGROUND_GREEN="\e[42m"
BACKGROUND_YELLOW="\e[43m"
BACKGROUND_BLUE="\e[44m"
BACKGROUND_MAGENTA="\e[45m"
BACKGROUND_CYAN="\e[46m"
BACKGROUND_WHITE="\e[47m"
BACKGROUND_BRIGHT_BLACK="\e[0;100m"
BACKGROUND_BRIGHT_RED="\e[0;101m"
BACKGROUND_BRIGHT_GREEN="\e[0;102m"
BACKGROUND_BRIGHT_YELLOW="\e[0;103m"
BACKGROUND_BRIGHT_BLUE="\e[0;104m"
BACKGROUND_BRIGHT_MAGENTA="\e[0;105m"
BACKGROUND_BRIGHT_CYAN="\e[0;106m"
BACKGROUND_BRIGHT_WHITE="\e[0;107m"
NO_COLOR="\e[0m"

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Git branch in prompt (no hostname - \h)
# http://stackoverflow.com/questions/5379986/why-doesnt-my-bash-prompt-update
# \u    # current username
# \n    # current hostname
# \w    # current directory with tilde
# \W    # basename of current directory
# $PWD  # full pathname of current directory
PS1="$BRIGHT_BOLD_GREEN\u$BRIGHT_BOLD_WHITE@$BRIGHT_BOLD_BLUE\h$BRIGHT_BOLD_WHITE:$BRIGHT_BOLD_MAGENTA\w$BRIGHT_BOLD_YELLOW\$(__git_ps1 '(%s)')$BRIGHT_BOLD_CYAN[\D{%F %T}]$NO_COLOR\n\$ "

# -----------------------------------------------------------------------------
# ls
# -----------------------------------------------------------------------------
export CLICOLOR=1

# -----------------------------------------------------------------------------
# grep
# -----------------------------------------------------------------------------
export GREP_OPTIONS='--color=auto'

# -----------------------------------------------------------------------------
# jupyter notebook
# -----------------------------------------------------------------------------
alias nb='jupyter notebook --browser=chrome'

# -----------------------------------------------------------------------------
# misc cmds
# -----------------------------------------------------------------------------
alias ll='ls -l'
alias lh='ls -lh'
