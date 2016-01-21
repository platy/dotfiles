#!/usr/bin/env bash

flush_dns() {
  sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
}

myip () {
  dig +short myip.opendns.com @resolver1.opendns.com
}
