#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# networking
inspect=`docker network inspect vmrc-network`
if [ inspect ]
then
  echo "replacing vmrc-network"
  docker network rm vmrc-network
fi

docker network create -d bridge \
  --subnet=172.18.0.0/16 \
  vmrc-network
