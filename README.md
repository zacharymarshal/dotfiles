dotfiles
========

Totally ripped from https://github.com/mathiasbynens/dotfiles. That guy is awesome.

# Laptop Setup Guide

I eventually need to automate all of these steps. I tried with boxen and was not too happy with the results.  So until then, here is goes;

## install apps via app store

- 1Password
- Bear
- Divvy
- Slack

## install some other apps

- Google Chrome https://www.google.com/chrome/browser/
- Dash https://kapeli.com/dash
- Spotify https://www.spotify.com/us/download/mac/
- Dropbox https://www.dropbox.com/downloading
- Docker https://hub.docker.com/editions/community/docker-ce-desktop-mac

## some mac defaults

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

## install homebrew http://brew.sh

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## install brew packages

```bash
brew install dnsmasq
brew install gnu-sed
brew install hub
brew install the_silver_searcher
brew install tmux
brew install vim

brew cleanup
```

## run dnsmasq services

```
sudo brew services start dnsmasq
```

## github app setup

- go through setup
- Install Command Line Tools

## install dotfiles

```bash
# Edit /etc/shells and add /usr/local/bin/bash
chsh -s /usr/local/bin/bash $USER
```

- clone dotfiles/ to ~/ using Github App

```bash
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitconfig-kelvin ~/.gitconfig-kelvin
ln -sf ~/dotfiles/bin ~/bin
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/inputrc ~/.inputrc
ln -sf ~/dotfiles/psqlrc ~/.psqlrc
```

## setup terminal

- Install Dracula theme https://draculatheme.com/terminal/
- Install Roboto Mono font, https://fonts.google.com/specimen/Roboto+Mono?selection.family=Roboto+Mono

### set some preferences

- Set Dracula as the Default Profile
- Set font to Roboto Mono Light 20pt
- Advanced > Bell > [Disable] **All** but Visual Bell
- Advanced > Keyboard > [Enable] Use Option as Meta key

## setup dropbox

### selective sync

- Application Support
- Screenshots
- Wallpapers

### turn off camera uploads

Preferences > Import > [ ] Enable camera uploads

## setup divvy

- Enable accessibility via System Preferences > Security > Privacy > Accessibility > [ ] Divvy
- Start Divvy at login
- Show Divvy in menu bar

### Shortcuts

- Mark as global shortcut for each

```
CTRL + ALT + LEFT ARROW  # left
CTRL + ALT + RIGHT ARROW # right
CTRL + ALT + UP ARROW    # fullscreen
```

## 1password setup

### set keychain via dropbox

`~/Dropbox/Application Support/1Password.agilekeychain`

### choose security settings

- Lock after 5 mins
- Lock when closed

### set regular settings

- Un-check Rich Icons
- Always keep mini running

## chrome setup

- login to Kelvin account & link data
- login to The Weekend Programmer account & link data
- add person & login to personal account

## ssh keys setup

- clone .ssh/ to ~/ using Github App

```
cd ~/.ssh
ssh-keygen -t rsa
# 1. put into id_rsa.Zacharys-MacBook-Pro
# 2. use a passphrase
# 3. update access_keys file
./bin/sshk-update
```

- ssh into all my servers and run it

```bash
git pull
./bin/sshk-update
```

### add ssh passphrase to keychain

```bash
/usr/bin/ssh-add -K ~/.ssh/id_rsa.Zacharys-MacBook-Pro
```

### update github with new public key

```bash
pbcopy < ~/.ssh/id_rsa.Zacharys-MacBook-Pro.pub
```

## update some system preferences

### general

- Use dark menu bar and dock
- Default web browser: Google chrome
- [Disable] Use LCD font smoothing

### desktop & screen saver

- Screen Saver
-- [Enable] Show with clock
-- Hot corner bottom right to start screensaver

### dock

- [Disable] Animate opening applications
- [Enable] Automatically hide and show the dock

### security & privacy

- Change require password to Immediately
- Show a message when the screen is locked "it's the little things ... i_found_your_macbook@zacharyrankin.com"

### spotlight

Search Results

- [Disable] All, **except** Applications and System Preferences
- [Disable] Allow Spotlight Suggestions in Spotlight and Look up

Privacy
- Add /opt

### notifications

Click on the hamburger at the top right > Remove everything except reminders

### energy saver

- Turn display off after **15 minutes** both Battery & Power Adapter
- [Disable] Power Nap on both Battery & Power Adapter

### keyboard

- Key Repeat: **Fast**
- Delay until Repeat: **Short**
- [Enable] Use all F1, F2, etc. keys...
- Turn off brightness after **10 secs**

### mouse

- [Disable] Scroll direction: natural

### trackpad

Point & Click

- [Disable] Look up & data detectors
- [Enable] Secondary click
- [Enable] Tap to Click
- Click: **light**
- [Disable] Force Click and haptic feedback

Scroll & Zoom

- [Disable] Scroll direction: natural

### App Store

- [Enable] Everything, **except** Automatically download apps purchased...

### users & groups

Login items:

- Dropbox
- Divvy

# ohmyzsh setup

```bash
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Give it some links
ln -sf ~/Dropbox/Application\ Support/zsh_history ~/.zsh_history
ln -sf ~/dotfiles/zulu.zsh-theme ~/.oh-my-zsh/themes/zulu.zsh-theme
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/Dropbox/Application\ Support/zsh ~/.zsh
```

# vim setup

```bash
ln -sf ~/dotfiles/vimrc ~/.vimrc

# Setup tmp dir for swp files
mkdir -p ~/.tmp

# Install color theme
mkdir -p ~/.vim/colors
ln -sf ~/dotfiles/init/bw.vim ~/.vim/colors/bw.vim

# Setup Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

# setup Dash

## General

- [Enable] Launch at Login
- Set up Syncing -> Set Sync Folder to Dropbox

# setup psql

- Install Postgres.app
- Create some links for our history:
```
ln -sf ~/Dropbox/Application\ Support/psql ~/.psql
```
