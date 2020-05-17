# This is an auto generated Dockerfile for racecarx:base
# https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/desktop-full/Dockerfile
FROM broerkens/jetson-ros:melodic-desktop-bionic

# install ros packages
RUN apt-get update && apt-get install -y \
    vim vim-runtime tmux screen git curl wget \ 
    ros-melodic-ackermann-msgs \
    ros-melodic-joy \
    python-rospkg \
    python-rosinstall python-rosinstall-generator python-wstool build-essential \
    python-scipy \
    python-serial \
    joystick \
    && rm -rf /var/lib/apt/lists/*

# install prerequisits for tensorflow 2.0
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev \
    && rm -rf /var/lib/apt/lists/*
    
## install librealsense
# Register the server's public key:
RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" > /etc/apt/sources.list.d/realsense.list

# Install librealsense library, tools and examples
RUN apt-get update && apt-get install -y \
    librealsense2-utils \
    librealsense2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install --upgrade \
    pip \
    setuptools

# Some TF tools expect a "python" binary
#RUN ln -s $(which python3) /usr/local/bin/python

RUN pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 enum34 futures testresources setuptools protobuf

RUN pip3 install https://github.com/fdasilva59/DeepNano/releases/download/2.0.0/tensorflow-2.0.0-cp36-cp36m-linux_aarch64.whl

COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

