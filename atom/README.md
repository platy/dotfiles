Here we have some atom configurations in atom.symlink. script/bootstrap will
install that for you.

## Packages.list

This is the list of installed packages for atom. It seemed better than including
all the packages themselves in .atom/.apm .

- atom/export_packages.sh creates the packages.list with the currently installed
packages
- atom/import_packages.sh installs all the packages from packages.list
