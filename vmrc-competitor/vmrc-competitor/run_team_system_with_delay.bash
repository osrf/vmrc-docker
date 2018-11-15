#!/usr/bin/env bash

echo "Waiting for ROS master"
. /opt/ros/*/setup.bash
until rostopic list ; do sleep 1; done

# Wait for the VMRC server to come up
sleep 20

# Run the team's system
echo "Running team's system"
/run_team_system.bash

echo "Team's system finished running"
