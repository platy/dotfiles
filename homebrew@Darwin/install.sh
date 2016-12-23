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

brew update

# Install homebrew packages
brew install coreutils
brew install Caskroom/cask/1password
brew install Caskroom/cask/evernote
brew install Caskroom/cask/google-chrome
brew install Caskroom/cask/spotify
brew install Caskroom/cask/enpass
brew install Caskroom/cask/webstorm
brew install wget
brew install Caskroom/cask/hipchat
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
