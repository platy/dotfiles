#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
  then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew install grc coreutils spark

cd "$(dirname $0)"/..

# find the homebrew dependent installers and run them iteratively
find . -name homebrew.install.sh | while read installer ; do sh -c "${installer}" ; done

exit 0
