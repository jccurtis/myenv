# My UNIX setup and App installation

Download:

```bash
mkdir ~/repos
git clone git@github.com:jccurtis/unix-setup.git ~/repos/unix-setup
```

## Setup

```bash
bash setup.sh
```

This will install everything for a bash or zsh configuration

### macOS

See [`./macOS/README.md`](./macOS/README.md)

### Ubuntu

Add me!

## Basic Env

### Atom
1. Install package `sync-settings`
1. Make new GIST key [here](https://github.com/settings/tokens/new) with `Create gists` enabled.
1. Input GIST key
1. Input GIST id (last part of gist link). For example my gist is [here](https://gist.github.com/jccurtis/769b5665e8d8bd5383ab) and my ID is `769b5665e8d8bd5383ab`

### bashrc

Download git user prompt tool

```bash
cd general
bash install_git_ps1.sh
```

Add to `~/.bashrc` (Ubuntu) or `~/.bash_profile` (macOS):

```bash
source ~/repos/unix-setup/general/bashrc.sh
```

## Optional

### SSH Key Auto Loading

Auto load ssh-key with `ssh-add`:

On `macOS`:

```bash
ssh-add -K ~/.ssh/id-rsa &> /dev/null
```

On `ubuntu`:

```bash
ssh-add ~/.ssh/id-rsa &> /dev/null
```
