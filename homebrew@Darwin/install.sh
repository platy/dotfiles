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

cd "$(dirname $0)"/..

# find the homebrew bundles and run them iteratively
find . -name *.brew \
  | while read installer; do
      echo "installing ${installer}"
      brew bundle --file="${installer}"
      echo "installed ${installer}"
  done

# find the homebrew dependent installers and run them iteratively
find . -name homebrew.install.sh \
  | while read installer; do
      echo "installing ${installer}"
      sh -c "${installer}"
      echo "installed ${installer}"
  done


exit 0
