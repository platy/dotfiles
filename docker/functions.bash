#!/usr/bin/env bash

build_trustyd() {
  docker build -f $DOTFILES/docker/trusty/Dockerfile -t trusty $DOTFILES
}

trustyd() {
  build_trustyd && \
  docker run -it --rm -v $HOME:/home/host -v $DOTFILES:/root/.dotfiles trusty
}

build_vertex_centos() {
  docker build -f $DOTFILES/docker/vertex-centos/Dockerfile -t vertex-centos $DOTFILES
}

vertex-centos() {
  build_vertex_centos && \
  docker run -it --rm -v $HOME:/home/host -v $DOTFILES:/root/.dotfiles vertex-centos
}

