This tutorial is based on
* JetPack 4.1.1 Developer Preview
* ROS Melodic

# Host PC Configuration
## Ubuntu Linux 18.04
 * Download [Ubuntu 18.04.02 Desktop image](https://ubuntu.com/download/desktop)
 * [Installing Ubuntu](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0)

## ROS Melodic
* [Install ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) using apt:

````bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop
````

* TODO Configure ROS

## RACECARX
````bash
cd $HOME
git clone https://github.com/MarkBroerkens/RACECARX.git

source ./RACECARX/scripts/
````





# Setting up the hardware components
## <a name="first_step"></a> Xavier: update to JetPack 4.1.1 Developer Preview
[Installing JetPack 4.1.1 Developer Preview on Jetsonhacks.com](https://www.jetsonhacks.com/2018/10/05/jetpack-4-1-developer-preview-nvidia-jetson-agx-xavier-developer-kit/)

Note: After installing JetPack, host computer is not able to apt-get update. This happens since the installer adds some ARM repositories. You will have to add [arch=amd64,i386] for each line in /etc/apt/sources.list starting with 'deb '. See [Issue on Nvidia DevTalk](https://devtalk.nvidia.com/default/topic/1004601/jetson-tx2/after-installing-jetpack3-0-host-computer-is-not-able-to-apt-get-update/post/5247401/#5247401)

## M.2 SSD
move home to SSD

## M.2 WIFI
check config

configure as access point


## Controller Sony DualShock 4 V2
The Xavier doesn't come with a Bluetooth controller. You can get the [DualShock 4 USB Wireless Adaptor](https://www.playstation.com/de-de/explore/accessories/dualshock-4-usb-wireless-adaptor/) in order to connect the Dualshock controller.

The pairing is described in the [DUALSHOCK®4 USB Wireless Adaptor Instruction Manual](https://www.playstation.com/en-nz/content/dam/support/manuals/scee/web-manuals/peripherals/ps4/ds4-usb-adapter/DS4_USB_Adapter_Ins_Manual_EN.pdf/)
```bash
sudo apt-get install joystick
ls /dev/input
jstest /dev/input/js0
```

## Focbox Electronic Speed Control
Get the [VESC Tool](https://vesc-project.com/vesc_tool). The free version is sufficient. The required Firmware [VESC_servoout.bin](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/VESC_servoout.bin) is available in the [vedderb/vesc_tool](https://github.com/vedderb/vesc_tool) github repository at [res/firmwares/410_o_411_o_412](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/)

## SparkFun 9DoF Razor IMU M0

## RPLidar A1M8

## Intel RealSense Depth Camera D435i
get a native Windows 10 installation and follow the [Intel update instructions](https://downloadcenter.intel.com/download/28481/Latest-Firmware-for-Intel-RealSense-D400-Product-Family?v=t)

Note: The Linux updater is made for linux x86 and thus cannot be executed on the Xavier

## <a name="kernel_build"></a>Rebuilding the kernel
First of all, you need to download necessary files like shown below to rebuild kernel:
```bash
cd ~/git
git clone https://github.com/MarkBroerkens/RACECARX-buildKernelXavier.git
```

see also: [Intel RealSense D435i on NVIDIA Jetson AGX Xavier](https://www.jetsonhacks.com/2019/01/21/intel-realsense-d435i-on-nvidia-jetson-agx-xavier/)

# Integration
## Install ROS Melodic
The racecar code runs using ROS (Robot Operating System) libraries, more on that later. Now let's install ROS:
(For more detailed instructions on how to install: http://wiki.ros.org/kinetic/Installation/Ubuntu). Or take the short path:

```bash
cd ~/git
git clone https://github.com/MarkBroerkens/RACECARX-installROSXavier.git
```

## Install ROS Nodes for RACECAR/X
```bash
cd ~/git
git clone https://github.com/MarkBroerkens/RACECARX-ROS.git
```


## Autostart ROS at boot
get robot-upstart from source (marks repos)
```bash

```


# References
* [OpenZeka Marc](https://github.com/openzeka/openzeka-marc-doc/edit/master/Documentation.md)
* [MIT RACECAR](https://mit-racecar.github.io)
