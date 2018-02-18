#! /bin/sh
ASDF_DIR=$HOME/.asdf
ASDF_BRANCH=v0.4.1
if [ ! -d $ASDF_DIR ]; then # new install
  git clone https://github.com/asdf-vm/asdf.git --branch $ASDF_BRANCH $ASDF_DIR && cd $ASDF_DIR && git checkout $ASDF_BRANCH
else
  cd "$ASDF_DIR" && git pull origin $ASDF_BRANCH
fi
