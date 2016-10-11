#!/usr/bin/env bash

trustyd() {
  docker build -f $DOTFILES/docker/trusty/Dockerfile -t trusty $DOTFILES
  docker run -it --rm trusty
}

