---
permalink: /docs/software/jetson_docker
title: "Software Setup - Docker on Jetson Xavier"
toc: true
---



The docker images are created on top of the l4t-base image from the Nvidia GPU Cloud.

## Get the installation scripts

```bash
echo 'export RACECARX=$HOME/racecarx' >> ~/.bashrc
echo 'export RACECARX_JETSON=$RACECARX/git/RACECARX/software/jetson' >> ~/.bashrc
source ~/.bashrc
```

```bash
mkdir -p $RACECARX/git
cd $RACECARX/git
git clone https://github.com/MarkBroerkens/RACECARX.git
```

## Install Udev Rules for the Peripherals 
(TODO: should go to pheripherals)


* Alias the Sparkfun 9DoF as /dev/imu
* Alias for electronic speed controller as /dev/vesc
* Alias for the rplidar as /dev/rplidar
* ALias for Intel RealSense D435i camera

```bash
cd $RACECARX_JETSON
./scripts/jetsonInstallUdev.sh
```

make sure we have write access to the VESC and IMU devices

```bash
sudo adduser $USER dialout
```

Further references:

* [ROS and Udev Rules](https://www.clearpathrobotics.com/assets/guides/kinetic/ros/Udev%20Rules.html)

## Build docker container
```bash
cd $RACECARX_JETSON
./scripts/docker_build_ros.sh
```

The docker image supports the following features:

1. Nvidia base image: l4t-base (r32.4.3)
2. ROS melodic
3. Realsense camera


## Initial setup
```bash
cd $RACECARX_JETSON
./scripts/docker_build_racecarx.sh
```


# Run the docker container in interactive mode

```bash
cd $RACECARX_JETSON
./scripts/docker_run_racecarx.sh
```


