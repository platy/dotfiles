#!/bin/bash

set -e

# Install / update vundle
VUNDLE_DIR=../.vim/bundle/Vundle.vim # vagrant runs this as root, so the home dir is wrong - using relative at the moment
if [ ! -d $VUNDLE_DIR ]; then # new install
	git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
else
	cd "$VUNDLE_DIR" && git pull origin master
fi

# Install plugins
echo "Installing Vundle plugins silently"
vim +PluginInstall +qall &>/dev/null

