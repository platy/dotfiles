FROM ubuntu:trusty

ENV HOME /home/mike
WORKDIR $HOME
RUN apt-get update
RUN apt-get install -y git openssh-client vim
ADD . .dotfiles
RUN bash .dotfiles/script/bootstrap
RUN .dotfiles/script/install

