#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install QuickLook addons
brew cask install qlstephen
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv

# Install useful stuff
brew install jq

# Install Iosevka
brew tap homebrew/cask-fonts
brew install --cask font-iosevka

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir -p $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Configure global Git
git config --global core.excludesfile ~/.dotfiles/.gitignore
git config --global init.defaultBranch main

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
