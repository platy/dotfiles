#!/usr/bin/env bash

rssh() {
  echo "Looking up host for EC2 instance named '$1'"
  declare -r HOST=`aws ec2 describe-instances --filters "Name=tag:Name,Values=${1}" | jq -r ".Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicDnsName"`
  if [[ $HOST != 'null' ]]; then
    echo "Host for '$1' is $HOST"
    ssh $AWS_USER@$HOST
  else
    echo 'Host was null, you dumbass'
  fi
}
