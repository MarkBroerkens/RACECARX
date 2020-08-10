#!/bin/bash
# Install the RACECAR/X software

# prerequisits:
#  docker image racecarx is created

# create folder
mkdir -p $HOME/racecarx
mkdir -p $HOME/racecarx/data
mkdir -p $HOME/racecarx/workspac-p $HOME/racecarx/.ros

# install the RACECARX software

sudo docker run \
	--runtime nvidia \
	-v $HOME/racecarx/workspace:/racecarx/workspace \
	-v $HOME/racecarx/RACECARX:/racecarx/RACECARX \
	-v $HOME/racecarx/.ros:/root/.ros \
	--privileged \
	ros:melodic-ros-base-l4t-r32.4.3 \
	/bin/sh -c "/racecarx/RACECARX/software/jetson/commands/installRACECARX.sh"

echo "The RACECAR Packages should now be installed in the directory $HOME/racecarx/workspace"
echo " " 



