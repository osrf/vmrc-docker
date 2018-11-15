#!/usr/bin/env bash
set -e

# Comment this line to rebuild using the cache
DOCKER_ARGS="--no-cache"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# -lt 1 ]]; then
  echo "$0 <ros-distro-to-build>"
  exit 1
fi

ROS_DISTRO_BUILD_TIME=${1-indigo}

case ${ROS_DISTRO_BUILD_TIME} in
  indigo)
    UBUNTU_DISTRO_TO_BUILD=trusty
    ;;
  kinetic)
    UBUNTU_DISTRO_TO_BUILD=xenial
    ;;
  *)
    echo "ROS distribution unsupported: ${ROS_DISTRO_BUILD_TIME}"
    exit 1
esac

# Create a Dockerfile from the template
cp ${DIR}/vmrc-competitor-base/Dockerfile_generic \
   ${DIR}/vmrc-competitor-base/Dockerfile
# Set the proper base image in the Dockerfile according to the ROS distro
sed -i "s+^FROM.*$+FROM osrf/ros:${ROS_DISTRO_BUILD_TIME}-desktop-full+" \
   ${DIR}/vmrc-competitor-base/Dockerfile


docker build ${DOCKER_ARGS} -t vmrc-competitor-base-${ROS_DISTRO_BUILD_TIME}:latest ${DIR}/vmrc-competitor-base
