#!/bin/sh
sudo docker run \
	-it \
	--runtime nvidia \
	--network host \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /dev:/dev \
	-v $RACECARX/.ros:/root/.ros \
	-v $RACECARX/data:/racecarx/data \
	-v $RACECARX/workspace:/racecarx/workspace \
	-v $RACECARX_JETSON/commands:/racecarx/bin \
	--privileged \
	ros:melodic-ros-base-l4t-r32.4.3 \
	$@
