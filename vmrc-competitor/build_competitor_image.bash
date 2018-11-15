#!/usr/bin/env bash

set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TEAM_NAME=$1
DOCKER_ARGS=$2
TEAM_CONFIG_DIR=${DIR}/../team_config/${TEAM_NAME}

docker build ${DOCKER_ARGS} -t vmrc-competitor-${TEAM_NAME}:latest ${TEAM_CONFIG_DIR}
