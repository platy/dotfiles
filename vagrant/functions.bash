#!/usr/bin/env bash

ubuntu() {
  VAGRANT_CWD=$DOTFILES/vagrant vagrant up && \
	  VAGRANT_CWD=$DOTFILES/vagrant vagrant ssh
}

