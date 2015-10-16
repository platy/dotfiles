#!/bin/sh

set -e

brew install node npm nvm

[ -e ~/.nvm ] || mkdir ~/.nvm
