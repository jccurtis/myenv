# macOS Setup

## System

* Trackpad direction to not natural (I'm old school :rofl:)
* Remove Siri from touchbar
* Add lock screen to touchbar
* [Prevent auto rearrangement of desktops](http://apple.stackexchange.com/questions/214348/how-to-prevent-mac-from-changing-the-order-of-desktops)

## Command line tools

```bash
xcode-select --install
```

## homebrew

```bash
./homebrew.zsh
```

Note this uses [`Brewfile`](https://github.com/Homebrew/homebrew-bundle)!

## zsh

```bash
zsh ./scripts/homebrew.zsh
```

## iTerm2

Set `Preferences>General` at the bottom `Load Preferences from a custom folder
or URL` to `~/repos/unix-setup/macOS` (this directory).

## Adobe

```bash
open "/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app"
```

## Odrive

```bash
open /Applications/odrive.app
```

## SSH Key Auto Loading

Auto load ssh-key with `ssh-add`:

On `macOS`:

```bash
ssh-add -K ~/.ssh/id-rsa &> /dev/null
```

## Maintenance

Rerun the bundler to check for updates:

```bash
brew.sh
```

## TODO

- [ ] Add preference script (keyboard repeat, display behavior)
- [ ] Add tap click to preferences
- [ ] Automate default Apps to open filetypes?
