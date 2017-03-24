#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -e

# Check for Homebrew
if test ! $(which brew)
  then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew cask install spectacle
brew cask install 1password
brew cask install evernote
brew cask install google-chrome
brew cask install spotify
brew cask install enpass
brew cask install flux

cd "$(dirname $0)"/..

# find the homebrew dependent installers and run them iteratively
find . -name homebrew.install.sh \
  | while read installer; do
      echo "installing ${installer}"
      sh -c "${installer}"
      echo "installed ${installer}"
  done

exit 0
