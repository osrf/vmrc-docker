#!/usr/bin/env bash

set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TEAM_NAME=$1
DOCKER_ARGS=$2

TEAM_CONFIG_DIR=${DIR}/../team_config/${TEAM_NAME}

ROS_DISTRO_BUILD_TIME=kinetic
# ROS_DISTRO_FILE=${TEAM_CONFIG_DIR}/ros_distro.txt
# if [ -f $ROS_DISTRO_FILE ]; then
#   ROS_DISTRO_BUILD_TIME=`cat $ROS_DISTRO_FILE`
#   echo "Using ROS distro of: ${ROS_DISTRO_BUILD_TIME}"
# else
#   ROS_DISTRO_BUILD_TIME=indigo
#   echo "ros_distro.txt not found. Assuming ROS distro of: indigo"
# fi

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
cp ${DIR}/vmrc-competitor/Dockerfile_generic \
   ${DIR}/vmrc-competitor/Dockerfile
# Set the proper base image in the Dockerfile according to the ROS distro
sed -i "s+^FROM.*$+FROM osrf/vmrc:competitor-base-${ROS_DISTRO_BUILD_TIME}+" \
   ${DIR}/vmrc-competitor/Dockerfile


# TODO: pass the path of the team's scripts as a parameter of the Dockerfile,
# instead of copying them temporarily so they always have the same location.
echo "Copying team scripts temporarily"
cp ${TEAM_CONFIG_DIR}/build_team_system.bash ${DIR}/vmrc-competitor/build_team_system.bash
cp ${TEAM_CONFIG_DIR}/run_team_system.bash ${DIR}/vmrc-competitor/run_team_system.bash

docker build ${DOCKER_ARGS} -t vmrc-competitor-${TEAM_NAME}:latest ${DIR}/vmrc-competitor

echo "Removing temporary team scripts"
rm ${DIR}/vmrc-competitor/build_team_system.bash
rm ${DIR}/vmrc-competitor/run_team_system.bash