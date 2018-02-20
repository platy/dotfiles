#!/bin/bash
if [ ! -d ~/.emacs.d ]; then # new install
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
  cd ~/.emacs.d && git pull
fi
