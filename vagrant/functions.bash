#!/usr/bin/env bash

ubuntu() {
  cd $DOTFILES/vagrant && vagrant up && vagrant ssh
}
