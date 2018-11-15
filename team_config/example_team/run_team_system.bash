#!/usr/bin/env bash

. ~/my_team_ws/install/setup.bash

# Run the example node
echo "Launching VMRC example nodes"
roslaunch vmrc_team_example example_nodes.launch
