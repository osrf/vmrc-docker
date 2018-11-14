# VMRC Automated Evaluation

This repository contains the setup that will be used to automatically evaluate
teams' submission for the Virtual Maritime RoboX Challenge (VMRC).

## Overview

The setup that is created by the code in this repository is the setup that will
be used for evaluating teams' systems automatically in the Qualifiers/Finals.
There are two main components to the VMRC competition setup: the VMRC server,
and the competitor's system.
For security and reproducibility, the VMRC server and the competitor's system
are run in separate isolated environments called containers.
Docker is used to create these containers.

## Getting the code

Clone this code repository locally:

```
mkdir -p ~/vmrc_ws && cd ~/vmrc_ws
hg clone https://bitbucket.org/osrf/vmrc-docker
cd ~/vmrc_ws/vmrc-docker
```

## Installing Docker

Please, follow [these instructions](https://docs.docker.com/engine/installation/linux/ubuntu/)
and install `Docker CE`.

Continue to the [post-install instructions](https://docs.docker.com/engine/installation/linux/linux-postinstall/)
and complete the "Manage Docker as a non-root user" section to avoid having to
run the commands on this page using `sudo`.

## Fetch the VMRC system

To prepare the VMRC competition system (but not run it), call:

```
./pull_dockerhub_images.bash
```

This will pull a Docker "images" of the latest version of the competition server
and the base competitor machine image.

These will take a while to download.

## Preparing the workspace

Team configuration files must be put into the `team_config` directory in a folder with the name of the team.

We have provided an example submission in the `team_config` directory of this repository.
You should see that there is a directory called `example_team` that has the following configuration files in it:

```
$ ls team_config/example_team/
build_team_system.bash  run_team_system.bash
```

Together these files constitute a submission.
The files are explained at https://bitbucket.org/osrf/ariac/wiki/2018/automated_evaluation
We will work with the files of the `example_team` submission for this tutorial; you can use them as a template for your own team's submission.