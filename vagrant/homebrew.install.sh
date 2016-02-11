#!/bin/sh

set -e

brew install Caskroom/cask/vagrant

cd vagrant && vagrant up
