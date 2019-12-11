#!/usr/bin/env bash

myip () {
  dig +short myip.opendns.com @resolver1.opendns.com
}

alias :q="echo NOT IN VIM!!!"

