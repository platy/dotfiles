#!/usr/bin/env bash

trusty() {
  cd $DOTFILES/vagrant && vagrant up default && vagrant ssh default
}

xenial() {
  cd $DOTFILES/vagrant && vagrant up xenial && vagrant ssh xenial
}

