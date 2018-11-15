FROM osrf/ros:kinetic-desktop-full

USER root

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    wget \
    && rm -rf /var/lib/apt/lists/*
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list

RUN rosdep update

# Create a new user called ariac-user and give them sudo priviledges.
ENV USERNAME ariac-user
RUN adduser --gecos "Development User" --disabled-password $USERNAME
RUN adduser $USERNAME sudo
WORKDIR /home/$USERNAME

# Create a catkin workspace
# RUN mkdir -p ~/my_team_ws/src

# Fetch the source code for our team's code
# RUN cd ~/my_team_ws/src
# ...

# Compile the code
# RUN cd ~/my_team_ws
# RUN catkin_make install

# Source all the needed environment files.
RUN /bin/sh -c 'echo ". /opt/ros/kinetic/setup.bash" >> ~/.bashrc'

# Launch your code
ENTRYPOINT ["rostopic pub /left_thrust_cmd std_msgs/Float32 'data: 0.5'"]
