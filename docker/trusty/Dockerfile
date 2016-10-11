FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y git openssh-client vim
WORKDIR /root
ADD . .dotfiles
RUN .dotfiles/script/install
RUN rm .bashrc && .dotfiles/script/bootstrap
WORKDIR /home/host

