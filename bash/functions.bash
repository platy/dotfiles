#!/usr/bin/env bash

myip () {
  dig +short myip.opendns.com @resolver1.opendns.com
}