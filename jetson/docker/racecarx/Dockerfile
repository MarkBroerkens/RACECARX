# This is an auto generated Dockerfile for racecarx:base
# https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/desktop-full/Dockerfile
FROM broerkens/jetson-ros:melodic-desktop-bionic

# install ros packages
RUN apt-get update && apt-get install -y \
    vim vim-runtime tmux screen git curl wget \ 
    ros-melodic-ackermann-msgs \
    python-rosinstall python-rosinstall-generator python-wstool build-essential \
    joystick \
    && rm -rf /var/lib/apt/lists/*

COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

