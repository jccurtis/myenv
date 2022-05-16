# My UNIX setup and App installation

Download:

```bash
git clone https://github.com:jccurtis/unix-setup.git ~/.myenv
```

## Shell

### `zsh`

I've moved to using zshell everywhere I configure things like this. See
[`README.md`](./shell/zsh/README.md) for more details. To setup you `zsh` env
(the default shell on macOS now):

```zsh
cd shell/zsh && ./setup.zsh
```

**NOTE:** After this setup, the zshell prompt will use characters which are not
available in the default terminal font on macOS or Ubuntu/Debian. They are from
the font-awesome package which will be installed at a later stage for macOS and
must be manually installed on Ubuntu/Debian (with `apt`).

### `bash` (legacy)

See [`README.md`](./shell/bash/README.md) for more details.

## Dev tools

### git

```bash
cd noOS && bash configure_git.sh
git config --global user.name "<first last>"
git config --global user.email "<email>"
```

### anaconda

Install anaconda and init with the current shell.

```bash
cd noOS && source anaconda_install.sh
```

## Operating System Specific

### macOS

See [`./macOS/README.md`](./macOS/README.md)

### Ubuntu

Add me!
