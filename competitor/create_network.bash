#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load global options.
. ${DIR}/../global.cfg

# networking
inspect=`docker network inspect ${competition_name}-network`
if [ inspect ]
then
  echo "replacing ${competition_name}-network"
  docker network rm ${competition_name}-network
fi

docker network create -d bridge \
  --subnet=172.18.0.0/16 \
  ${competition_name}-network
