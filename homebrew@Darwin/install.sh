#! /bin/sh
set -e

# Check for Homebrew
if test ! $(which brew)
  then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname $0)"/..

# find the homebrew bundles and run them all
echo "Installing brew bundles"
cat $(find . -name *.brew) | \
  brew bundle --file=-

# find the homebrew dependent installers and run them iteratively
find . -name homebrew.install.sh \
  | while read installer; do
      echo "installing ${installer}"
      sh -c "${installer}"
      echo "installed ${installer}"
  done


exit 0
