#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "  Upgrading Homebrew."
  brew update
  echo "  Upgrading Homebrew packages."
  brew upgrade --all
fi

# Install homebrew packages

# Utils
brew install ack  # better grep
brew install autojump  # jump to directories
brew install wget
brew install zsh zsh-syntax-highlighting
brew install gist
brew install libgit2 --with-libssh2

# Development
brew install redis

# postgresql
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# gettext
brew install gettext
brew link gettext --force

# Cleanup
brew cleanup

exit 0
