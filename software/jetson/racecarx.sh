#!/bin/sh
sudo docker run \
	-it \
	--runtime nvidia \
	--network host \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /dev:/dev \
	-v $HOME/racecarx/.ros:/root/.ros \
	-v $HOME/racecarx/data:/racecarx/data \
	-v $HOME/racecarx/workspace:/racecarx/workspace \
	-v $HOME/racecarx/RACECARX:/racecarx/RACECARX \
	--privileged \
	ros:melodic-ros-base-l4t-r32.4.3
