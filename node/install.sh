#!/bin/sh

set -e

NVM_DIR=../.nvm # vagrant runs this as root, so the home dir is wrong - using relative at the moment
if [ ! -d $NVM_DIR ]; then # new install
  git clone https://github.com/creationix/nvm.git $NVM_DIR && cd $NVM_DIR && git checkout `git describe --abbrev=0 --tags`
else
  cd "$NVM_DIR" && git pull origin master && git checkout `git describe --abbrev=0 --tags`
fi
