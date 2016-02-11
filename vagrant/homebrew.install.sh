#!/bin/sh

set -e

brew install Caskroom/cask/vagrant Caskroom/cask/virtualbox

cd vagrant
vagrant provision
:
