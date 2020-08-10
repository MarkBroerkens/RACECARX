---
permalink: /docs/software/peripherals
title: "Software Setup - Sensors and Actuators"
toc: true
---


## Controller Sony DualShock 4 V2
Connect the Controller via bluetooth

```bash
sudo bluetoothctl
[bluetooth]# agent on
[bluetooth]# default-agent
[bluetooth]# scan on
[bluetooth]# pair DC:0C:FF:B2:79:EE
[bluetooth]# <Authorize...< yes
```

Test the controller

```bash
sudo apt-get install joystick
ls /dev/input 
jstest /dev/input/js0
```

## Realsense d435i camera
Run the racecarx docker container in interactive mode

```bash
~/racecarx/RACECARX/racecarx.sh
```

Run the firmware update tool and print the connected devices

```bash
rs-fw-update -l
```

My oputput looks like this

```
connected devices:
1) Name: Intel RealSense D435I, serial number: xxxxxxxxx, update serial number: xxxxxxxx, firmware version: 05.11.06.250, USB type: 3.2
```

Find the latest firmware and copy its link 
[latest firmware](https://downloadcenter.intel.com/download/29255/Latest-Firmware-for-Intel-RealSense-D400-Product-Family?product=128255)

download and install latest firmware. See also [here](https://dev.intelrealsense.com/docs/firmware-update-tool)

```bash
cd /tmp
wget https://downloadmirror.intel.com/29255/eng/D400_Series_Development_FW_5_12_1.zip
apt update # gets the index
apt-get install unzip # installs unzip
unzip D400_Series_Development_FW_5_12_1.zip
rs-fw-update -f Signed_Image_UVC_5_12_1_0.bin
```

we should see the updated firmware version

```bash
rs-fw-update -l
```



## Focbox Electronic Speed Control
* Get the [VESC Tool](https://vesc-project.com/vesc_tool). The free version is sufficient. 
* The required Firmware [VESC_servoout.bin](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/VESC_servoout.bin) is available in the [vedderb/vesc_tool](https://github.com/vedderb/vesc_tool) github repository at [res/firmwares/410_o_411_o_412](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/)

## SparkFun 9DoF Razor IMU M0
Install Arduino Firmware as described [here](https://github.com/MarkBroerkens/razor_imu_9dof)

## RPLidar A1M8
INstallation consists of proper configuration of UDEV rules.



