#!/usr/bin/env bash

set -e

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEST_MOUNT="$ROOT/../test:/test"
ROS_DISTRO=${1:-"all"}

test_ros_version()
{
	echo "testing container $1 => ros_version"
	sh ./scripts/docker_run.sh -c $1 -v $TEST_MOUNT -r test/test_ros_version.sh
	echo -e "done testing container $1 => ros_version\n"
}


# Melodic
if [[ "$ROS_DISTRO" == "melodic" || "$ROS_DISTRO" == "all" ]]; then
	test_ros_version "ros:melodic-ros-base-l4t-r32.4.3"
fi

