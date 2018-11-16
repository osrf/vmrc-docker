#!/usr/bin/env bash

# Uncomment for debugging.
# set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load global options.
. ${DIR}/../global.cfg

TEAM_NAME=$1
DOCKER_ARGS=$2
TEAM_CONFIG_DIR=${DIR}/../team_config/${TEAM_NAME}

docker build ${DOCKER_ARGS} -q -t ${competition_name}-competitor-${TEAM_NAME}:latest ${TEAM_CONFIG_DIR}
