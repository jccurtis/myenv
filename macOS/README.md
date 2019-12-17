# macOS Setup

## Initialization

### Install everything with homebrew

Install [homebrew](https://brew.sh/)

Switch to this repo:

```bash
cd ~/repos/unix-setup/macOS
```

Install cmd line tools and apps from the [`Brewfile`](https://github.com/Homebrew/homebrew-bundle):

```bash
brew.sh
```

Cleanup downloaded files:

```bash
brew cleanup
```

### Texlive

Change texlive installation owner so tlmgr will work:

```bash
sudo chown -R $(whoami) /usr/local/texlive/
```

### iTerm2

Set `Preferences>General` at the bottom `Load Preferences from a custom folder or URL` to `~/repos/unix-setup/macOS` (this directory).

### Adobe

```bash
open "/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app"
```

### Odrive

```bash
open /Applications/odrive.app
```

## Maintenance

Rerun the bundler to check for updates:

```bash
brew.sh
```

## TODO

- [ ] Remove Siri from touchbar
- [ ] Add lock screen to touchbar
- [ ] [Prevent auto rearrangement of desktops](http://apple.stackexchange.com/questions/214348/how-to-prevent-mac-from-changing-the-order-of-desktops)
- [ ] Add preference script (keyboard repeat, display behavior)
- [ ] Add tap click to preferences
- [ ] Automate default Apps to open filetypes?
