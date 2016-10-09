FROM ubuntu:trusty

ENV HOME /home/mike
WORKDIR $HOME
ADD . .dotfiles
RUN bash .dotfiles/script/bootstrap
# RUN bash .dotfiles/script/install

