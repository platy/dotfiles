#!/bin/sh

set -e

brew install Caskroom/versions/docker-beta

docker build -f $DOTFILES/docker/trusty/Dockerfile -t trusty $DOTFILES

