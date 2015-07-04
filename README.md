dotfiles
========

Totally ripped from https://github.com/mathiasbynens/dotfiles. That guy is awesome.

# Laptop Setup Guide

I eventually need to automate all of these steps. I tried with boxen and was not too happy with the results.  So until then, here is goes;

## install apps via app store

- Caffeine
- Dash 2
- Divvy
- LimeChat
- Numbers
- Pages
- Slack
- The Unarchiver

## install command line tools

Type `git` into Terminal, you will be prompted to install the CLI tools

## install homebrew http://brew.sh

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## install brew cask

```
brew install caskroom/cask/brew-cask
```

## install applications

```
brew cask install 1password
brew cask install atom
brew cask install battle-net
brew cask install caskroom/homebrew-versions/java6
brew cask install caskroom/homebrew-versions/sublime-text3
brew cask install dropbox
brew cask install github
brew cask install google-chrome
brew cask install phpstorm
brew cask install postgres
brew cask install spotify
brew cask install vagrant
brew cask install virtualbox

brew cask cleanup
```

## install brew packages

```
brew install ack
brew install bash
brew install dnsmasq
brew install git
brew install gnu-sed --with-default-names
brew install homebrew/dupes/grep --with-default-names
brew install homebrew/php/php55 --with-postgresql
brew install homebrew/versions/bash-completion2
brew install node

brew cleanup
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
ln -sf ~/dotfiles/aliases ~/.aliases
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/dotfiles/bash_prompt ~/.bash_prompt
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/exports ~/.exports
ln -sf ~/dotfiles/functions ~/.functions
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/path ~/.path
ln -sF ~/dotfiles/bin ~/
ln -sF ~/dotfiles/init ~/
```

## setup terminal

```bash
open ~/init/Solarized\ Dark\ xterm-256color.terminal
```

### set some preferences

- Set Solarized Dark as the Default Profile
- Set font to Monaco 20pt
- Advanced > Bell > [Disable] Audio bell & Only when sound is muted

## setup dropbox

### selective sync, don't include

- Camera Uploads
- Carousel
- OTCD
- Photos

### turn off camera uploads

Preferences > Import > [ ] Enable camera uploads

## setup caffine

- Automatically start at login
- Activate at launch
- Default duration 2 hours

## setup divvy

- Enable accessibility via System Preferences > Security > Privacy > Accessibility > [ ] Divvy
- Start Divvy at login
- Show Divvy in menu bar

### Shortcuts

- Mark as global shortcut for each

```
CMD + ALT + LEFT ARROW  # left
CMD + ALT + RIGHT ARROW # right
CMD + ALT + UP ARROW    # fullscreen
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

- login to illuminate account & link data
- add person & login to personal account

## ssh keys setup

- clone .ssh/ to ~/ using Github App

```
cd ~/.ssh
ssh-keygen -t rsa
# 1. put into id_rsa.Zacharys-MacBook-Pro-3
# 2. use a passphrase
# 3. update access_keys file
./bin/sshk-update
```

- ssh into all my servers and run it

```
git pull
./bin/sshk-update
```

### add ssh passphrase to keychain

```
/usr/bin/ssh-add -K ~/.ssh/id_rsa.Zacharys-MacBook-Pro-2
```

### update github with new public key

```bash
pbcopy < ~/.ssh/id_rsa.Zacharys-MacBook-Pro-2.pub
```

## update some system preferences

### general

- Use dark menu bar and dock
- Default web browser: Google chrome
- [Disable] Use LCD font smoothing

### desktop & screen saver

- Screen Saver
-- [Enable] Show with clock

### dock

- [Disable] Animate opening applications
- [Enable] Automatically hide and show the dock

### security & privacy

- Change require password to Immediately
- Show a message when the screen is locked "it's the little things ... i_found_your_macbook@zacharyrankin.com"

### spotlight

Search Results

- [Disable] All, **except** Applications
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
- Caffeine
- Divvy
