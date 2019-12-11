[![Build Status](https://travis-ci.org/platy/dotfiles.svg?branch=master)](https://travis-ci.org/platy/dotfiles)

# These are my dotfiles, this is where I dot my files.

This follows Holman's modular approach and using file extensions to classify
what should be done with the file.

Installers with:

- basic dependency tree (depended calls installers for dependents)
- platform specific scripts and modules (`@Linux` / `@Darwin`)

Bash profile scripts with:

- platform specific scripts and modules (`@Linux` / `@Darwin`)

Ubuntu development environment on mac:

- Uses VirtualBox / Vagrant with Linux installers used for provisioning
- dotfiles linked for a consistent bash environment
- **In progress: replace with Docker** 

## Usage

- Clone to ~/.dotfiles or similar.
- Run .dotfiles/script/bootstrap to make symlinks to dotfiles
- Run .dofiles/script/install to install stuff

## Script naming conventions

- install.sh should be installed by the install script.
- homebrew.install.sh should be installed once homebrew is installed. etc..
- scripts or modules with `@Darwin` in the path should only be run on OSX, likewise for `@Linux`
- scripts ending .rc.bash or .rc.sh will be sourced in .bashrc
- scripts ending .rc.zsh or .rc.sh will be sourced in .zshrc

## Config naming conventions

- *.symlink files will be symlinked into home dir
- *.config files will be symlinked into ~/.config

## References

- [Holmans's dotfiles](https://github.com/holman/dotfiles)
- [Mathias Bynan's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Nikita Afanasenko's dotfiles](https://github.com/nikitug/dotfiles)
- [Sample .bashrc](http://tldp.org/LDP/abs/html/sample-bashrc.html)

## TODO

- zsh
- Also should be able to use parts for some bash environment I'm ssh'd into.
- Have unit tests.

