#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install bash
brew tap homebrew/versions
brew install bash-completion2

brew install wget --enable-iri

brew install postgresql

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-postgresql

brew install ack
brew install git
brew install node

brew cleanup