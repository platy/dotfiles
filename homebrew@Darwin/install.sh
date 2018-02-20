#! /bin/sh
set -e

# Check for Homebrew
if test ! $(which brew)
  then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# find the homebrew bundles and run them all
echo "Installing brew bundle"
brew bundle --file=gen/Brewfile

# find the homebrew dependent installers and run them iteratively
find $DOTFILES -name homebrew.install.sh \
  | while read installer; do
      echo "installing ${installer}"
      sh -c "${installer}"
      echo "installed ${installer}"
  done

exit 0
