#!/bin/bash
# Install the RACECAR/X software

# prerequisits:
#  docker image racecarx is created

# create folder
mkdir -p $RACECARX
mkdir -p $RACECARX/data
mkdir -p $RACECARX/workspace
mkdir -p $RACECARX/.ros

# install the RACECARX software

sudo docker run \
	--runtime nvidia \
	-v $RACECARX/workspace:/racecarx/workspace \
	-v $RACECARX_JETSON/commands:/racecarx/bin \
	-v $RACECARX//.ros:/root/.ros \
	--privileged \
	ros:melodic-ros-base-l4t-r32.4.3 \
	/bin/sh -c "/racecarx/bin/installRACECARX.sh"

echo "The RACECAR Packages should now be installed in the directory $RACECARX/workspace"
echo " " 



