#!/bin/sh

# The Iron Yard - Little Rock - FEE June 2015
# Super Install Script
#
# Heavily borrowing on the shoulders of giants
# MIT or similar license probably applies
# Thanks to Jacob Smith from the GVL campus of The Iron Yard

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install Git
brew install git

# Install Github's Hub: a terminal
# tool for working with Github
brew install hub

clis=(
  trash
  iojs
  hubflow
)
brew install install ${clis[@]}

brew cleanup

# Install brew cask
brew install caskroom/cask/brew-cask

brew tap caskroom/versions

# Apps
apps=(
  alfred
  google-chrome
  sublime
  mou
  slack
  dash
  iterm2
  screenhero
  github

  flux
  quicklook-json
  sublime-text3
  spectacle
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Setting Git to use Atom as default editor"
git config --global core.editor "subl -n -w"
