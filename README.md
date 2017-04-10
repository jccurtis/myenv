My macOS setup and App installation

## Misc

- Remove Siri from touchbar
- Add lock screen to touchbar
- [Prevent auto rearrangement of desktops](http://apple.stackexchange.com/questions/214348/how-to-prevent-mac-from-changing-the-order-of-desktops)

## iTerm2

Set `Preferences>General` at the bottom `Load Preferences form a custom folder or URL` to `~/repos/macOS-setup` (this directory).

## Atom
1. Install package `sync-settings`
1. Make new GIST key [here](https://github.com/settings/tokens/new) with `Create gists` enabled.
1. Input GIST key
1. Input GIST id (last part of gist link). For example my gist is [here](https://gist.github.com/jccurtis/769b5665e8d8bd5383ab) and my ID is `769b5665e8d8bd5383ab`

## Adobe

## bashrc

Download git user prompt tool

```bash
bash install_git_ps1.sh
```

Add to `./bash_profile`:

```bash
source ~/repos/bashrc.sh
```

## TODO

- [ ] Add preference script (keyboard repeat, display behavior)
- [ ] Add tap click to preferences
- [ ] Automate default Apps to open filetypes?
