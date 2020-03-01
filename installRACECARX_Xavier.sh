#!/bin/bash
# Install the RACECAR/X software

# prerequisits:
#  docker image racecarx is created

# create folder
mkdir -p $HOME/racecarx
mkdir -p $HOME/racecarx/data
mkdir -p $HOME/racecarx/workspace
mkdir -p $HOME/racecarx/.ros

# install udev rules
./scripts/installRACECARXUdev.sh

# make sure we have write access to the VESC and IMU devices
#sudo adduser $USER dialout

# install the RACECARX software
# -u $(id -u):$(id -g) \
sudo docker run \
	--runtime nvidia \
	-v $HOME/racecarx/workspace:/racecarx/workspace \
	-v $HOME/racecarx/RACECARX:/racecarx/RACECARX \
	-v $HOME/racecarx/.ros:/root/.ros \
	--privileged \
	racecarx:base \
	/bin/sh -c "/racecarx/RACECARX/scripts/installRACECARX.sh"

echo "The RACECAR Packages should now be installed in the directory $HOME/racecarx/workspace"
echo " " 



