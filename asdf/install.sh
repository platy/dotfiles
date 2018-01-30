ASDF_DIR=../.asdf # vagrant runs this as root, so the home dir is wrong - using relative at the moment
ASDF_BRANCH=v0.4.1
if [ ! -d $ASDF_DIR ]; then # new install
  git clone https://github.com/asdf-vm/asdf.git --branch $ASDF_BRANCH $ASDF_DIR && cd $ASDF_DIR && git checkout $ASDF_BRANCH
else
  cd "$ASDF_DIR" && git pull origin $ASDF_BRANCH
fi

