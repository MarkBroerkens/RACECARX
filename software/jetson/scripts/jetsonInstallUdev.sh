#!/bin/bash
# Copy the RACECAR udev rules to /etc/udev/rules.d
# * Alias the Sparkfun 9DoF as /dev/imu
# * Alias for electronic speed controller as /dev/vesc
# * Alias for the rplidar as /dev/rplidar
# * ALias for Intel RealSense D435i camera

sudo cp ./udev/10-racecar.rules /etc/udev/rules.d

# Reread the rules; You may need to physically replug
sudo udevadm control --reload-rules 
sudo udevadm trigger
echo 'RACECARX Rules installed'
