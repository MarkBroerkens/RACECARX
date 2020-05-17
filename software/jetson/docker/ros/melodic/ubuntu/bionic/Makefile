all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build            - build all images"
	@echo "   2. make pull             - pull all images"
	@echo "   3. make clean            - remove all images"
	@echo ""

build:
	@docker build --tag=broerkens/jetson-ros:melodic-ros-core-bionic          ros-core/.
	@docker build --tag=broerkens/jetson-ros:melodic-ros-base-bionic          ros-base/.
	@docker build --tag=broerkens/jetson-ros:melodic-robot-bionic             robot/.
	@docker build --tag=broerkens/jetson-ros:melodic-perception-bionic        perception/.
	@docker build --tag=broerkens/jetson-ros:melodic-desktop-bionic      desktop/.
	@docker build --tag=broerkens/jetson-ros:melodic-desktop-full-bionic desktop-full/.

pull:
	@docker pull broerkens/jetson-ros:melodic-ros-core-bionic
	@docker pull broerkens/jetson-ros:melodic-ros-base-bionic
	@docker pull broerkens/jetson-ros:melodic-robot-bionic
	@docker pull broerkens/jetson-ros:melodic-perception-bionic
	@docker pull broerkens/jetson-ros:melodic-desktop-bionic
	@docker pull broerkens/jetson-ros:melodic-desktop-full-bionic

clean:
	@docker rmi -f broerkens/jetson-ros:melodic-ros-core-bionic
	@docker rmi -f broerkens/jetson-ros:melodic-ros-base-bionic
	@docker rmi -f broerkens/jetson-ros:melodic-robot-bionic
	@docker rmi -f broerkens/jetson-ros:melodic-perception-bionic
	@docker rmi -f broerkens/jetson-ros:melodic-desktop-bionic
	@docker rmi -f broerkens/jetson-ros:melodic-desktop-full-bionic
