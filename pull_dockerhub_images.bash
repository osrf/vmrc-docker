#!/bin/bash
set -e

ROS_DISTRO=${1-kinetic}

case ${ROS_DISTRO} in
  kinetic)
    echo Using ROS distro "kinetic" on ubuntu distro "xenial"
    ;;
  *)
    echo "ROS distribution unsupported: ${ROS_DISTRO}"
    exit 1
esac
echo "Pulling the VMRC competition images from dockerhub (with Nvidia support)"

docker pull osrf/vmrc:nvidia_current
docker pull osrf/vmrc:competitor-base-${ROS_DISTRO}
