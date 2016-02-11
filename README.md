# These are my dotfiles, this is where I dot my files.

This follows Holman's modular approach and using file extensions to classify
what should be done with the file.

## Usage

- Clone to ~/.dotfiles or similar.
- Run .dotfiles/script/bootstrap to make symlinks
- Run .dofiles/script/install to install stuff

## Script naming conventions

- install.sh should be installed by the install script.
- homebrew.install.sh should be installed once homebrew is installed. etc..
- scripts with @Darwin in the path should only be run on OSX, likewise for @Linux

## References

- [Holmans's dotfiles](https://github.com/holman/dotfiles)
- [Mathias Bynan's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Nikita Afanasenko's dotfiles](https://github.com/nikitug/dotfiles)
- [Sample .bashrc](http://tldp.org/LDP/abs/html/sample-bashrc.html)

## Plan

- development linux vm
- Modularise bash_profile.
- Set up whole osx environment.
- Also should be able to use parts for some bash environment I'm ssh'd into.
- Have unit tests.
