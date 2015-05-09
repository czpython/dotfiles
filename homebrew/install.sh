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
brew install coreutils  # GNU coreutils
brew install grc  # shell colouriser
brew install spark  # spark lines in shell: $ spark 0 30 55 80 33 150 => ▁▂▃▅▂▇
brew install ack  # better grep
brew install autojump  # jump to directories
brew install thefuck  # correct incorrectly spelled commands
brew install wget
brew install bash-completion
brew install gist

# Development
brew install \
	python python3 \
	postgresql \
	redis solr \
	git hub \
	gettext

brew link gettext --force

# Network Pentest
brew install aircrack-ng nmap


# Cleanup
brew cleanup

exit 0
