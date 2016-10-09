#!/bin/sh

set -e

echo what docker package should i install?

docker build -f .dotfiles/docker/trusty/Dockerfile -t trusty .dotfiles

