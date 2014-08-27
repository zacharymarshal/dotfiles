dotfiles
========

Totally ripped from https://github.com/mathiasbynens/dotfiles. That guy is awesome.

### Install Sublime Text 3
### Install Chrome

### Install Dotfiles

```bash
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
```

```bash
homeshick clone zacharyrankin/dotfiles
```

### Sensible OS X defaults

```bash
./.osx
```

### Install Homebrew formulae

```bash
brew bundle ~/Brewfile
```

### Change to latest version of bash

```bash
# Edit /etc/shells and add /usr/local/bin/bash
chsh -s /usr/local/bin/bash $USER
```
