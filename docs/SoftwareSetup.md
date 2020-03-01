<TITLE>RACECARX Software Setup</TITLE>

[toc]


This tutorial is based on

 * JetPack 4.3
 * ROS Melodic

# Setup NVIDIA Xavier

## Install JetPack 4.3
* Download and install [NVIDIA SDK Manager](https://developer.nvidia.com/embedded/jetpack)
* Note: Select the manual installation mode. 
  Automatic mode might have issues when starting up in headless mode. See bug 200525134 in the [L4T Release Notes](https://docs.nvidia.com/jetson/l4t/pdf/Jetson_Linux_Driver_Package_Release_Notes_R32.3.1_GA.pdf)
* Notes
 * During first boot a configured _racecarx_ as hostname and 
 * added a user called _mark_ 
  
## Enable password-less login via ssh
In order to be able to login via ssh into the racecarx without typing your password, you can create a pair of private / public ssh keys and upload the public key in the ~/.ssh/autorized_keys on the racecarx.

Create the ssh keys

```bash
ssh-keygen
```

upload the public key to racecarx

```bash
ssh-copy-id mark@racecarx
```

Now you schould be able to login without password by typing

```bash
ssh mark@racecarx
```

## Extend disk memory
### Install M.2 NVMe SSD
JetsonHacks provides a good description for [installing the SSD on the NVIDIA Jetson AGX Xavier](https://www.jetsonhacks.com/2018/10/18/install-nvme-ssd-on-nvidia-jetson-agx-developer-kit/).

### Mount SSD
We mount the partition on the SSD via UUID in order to be robust with respect to potentially changing device identifiers. Especially important if you are using USB devices.

```bash
# create the mount point
sudo mkdir /XavierSSD500

# find UUID of an ext4 partition on SSD. 
# you can search for the label. E.g. label="XavierSSD500"
sudo blkid

# backup the original fstab file that
sudo cp /etc/fstab /etc/fstab.orig

# add mount information to ssd partition into fstab
sudo vim /etc/fstab

# :i (switch to insert mode)
# insert UUID=<yout uuid is identified above>  /XavierSSD500 ext4 nosuid,nodev,auto,nouser 0 2
# <ESC>
# :wq (write and quit)

# mount the ssd according to new data in fstab
sudo mount /XavierSSD500
```


### Move /home to SSD
```bash
# create the new home folder on the SSD
sudo mkdir /XavierSSD500/home
# copy the home folder to the ssd preserving symlinks, permissions, access rights, ...
sudo rsync -aXS /home/. /XavierSSD500/home/.
sudo mv /home /home.orig; sudo ln -s /XavierSSD500/home /home
sudo diff -qr /home /home.orig # diff quietly and move into subfolders

```

Reboot. If everything works:

```bash
sudo rm -rf /home.orig
```

### Move docker data directory to SSD
* Stop the docker daemon

```
sudo service docker stop
```

* Edit configuration file /etc/docker/daemon.json to tell the docker daemon what is the location of the data directory. The content should look like:

```json
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "graph": "/XavierSSD500/var/lib/docker"
}
```

* Copy the current data directory to the new one

```bash
sudo rsync -aP /var/lib/docker/ /XavierSSD500/var/lib/docker
```

* Rename the old docker directory

```bash
sudo mv /var/lib/docker /var/lib/docker.old
```

This is just a sanity check to see that everything is ok and docker daemon will effectively use the new location for its data.

* Restart the docker daemon

```bash
sudo service docker start
```

* Test

```bash
sudo docker run hello-world
```
This should download and run the hello-world container. Docker should have created several files in /XavierSSD500/var/lib/docker

If everything worked as expected you can delete the old docker folder /var/lib/docker.old. This is only required in case docker was used before and the folder existed.

## Add Wifi / Bluetooth
### Install Wifi/Bluetooth M.2 module
TODO: HW installation of intel 8265 M.2 module

### Enable wifi
JetPack 4.3 should detect the intel 8265 M.2 wifi module out of the box. 
You should see the device wlan0 in the Network Manager:

```bash
nmcli device
```

Create a new wlan connection for you ssid.

```bash
sudo nmcli connection add ifname wlan0 type wifi ssid "B3 5GHz"
```

Configure the authentication mode to WPA and set the password.

```bash
sudo nmcli connection edit wifi-wlan0
```

configure 

```

===| nmcli interactive connection editor |===

Editing existing '802-11-wireless' connection: 'wifi-wlan0'

Type 'help' or '?' for available commands.
Type 'describe [<setting>.<prop>]' for detailed property description.

You may edit the following settings: connection, 802-11-wireless (wifi), 802-11-wireless-security (wifi-sec), 802-1x, ipv4, ipv6, tc, proxy
nmcli> goto wifi
You may edit the following properties: ssid, mode, band, channel, bssid, rate, tx-power, mac-address, cloned-mac-address, generate-mac-address-mask, mac-address-blacklist, mtu, seen-bssids, hidden, powersave, mac-address-randomization
nmcli 802-11-wireless> set mode infrastructure
nmcli 802-11-wireless> back
nmcli> goto wifi-sec
You may edit the following properties: key-mgmt, wep-tx-keyidx, auth-alg, proto, pairwise, group, pmf, leap-username, wep-key0, wep-key1, wep-key2, wep-key3, wep-key-flags, wep-key-type, psk, psk-flags, leap-password, leap-password-flags, wps-method
nmcli 802-11-wireless-security> set key-mgmt wpa-psk
nmcli 802-11-wireless-security> set psk myPasswordGoesHere
nmcli 802-11-wireless-security> save
Connection 'wifi-wlan0' (f425bcdd-c8a5-48b5-906e-b0b002e8aaaa) successfully updated.
nmcli 802-11-wireless-security> quit

```

## Enable bluetooth 
Check if the 8265 wifi / bluetooth module is detected

```bash
lspci
```

```bash
rfkill list
```

Check if bluetooth devices are blocked

```
mark@racecarx:~$ rfkill list
0: bluedroid_pm: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
```

if they are soft blocked, then execute

```bash
sudo rfkill unblock bluetooth
```

# Setup Racecarx docker
## Build the docker images
### Login to NGC docker registry
The docker images are created on top of the l4t-base image from the Nvidia GPU Cloud.
Before accessing locked NGC content, you must sign up for an NGC account and obtain an API key as explained in the NGC Getting Started Guide. Then log in to the NGC registry from the command line as follows.
Log in to the NGC container registry.
```bash
$ sudo docker login nvcr.io
```
When prompted for your user name, enter the following text:
```bash
$oauthtoken
```

The $oauthtoken username is a special user name that indicates that you will authenticate with an API key and not a username and password.
When prompted for your password, enter your NGC API key as shown in the following example.

```bash
Username: $oauthtoken
Password: yourAuthTokenFromNGC
```

Tip: When you get your API key, copy it to the clipboard so that you can paste the API key into the command shell when you are prompted for your password.

After successful login you will get the following message

```
WARNING! Your password will be stored unencrypted in /home/mark/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

Reference: [Logging in to the NGC container registry](https://docs.nvidia.com/ngc/ngc-user-guide/pullcontainer.html#logging-in-to-ngc-registry)

### Get the installation scripts

````bash
mkdir ~/racecarx
cd ~/racecarx
git clone https://github.com/MarkBroerkens/RACECARX.git
````

### Build docker container
```bash
cd RACECARX/jetson/docker
sudo make build
```

TODO: describe content of racecarx docker image

1. l4t-base
2. ros
3. realsense camera


### Initial setup
```bash
cd ~/racecarx/RACECARX
./installRACECARX_Xavier.sh
```







# Setup sensors and actuators
## Controller Sony DualShock 4 V2
<TODO> how to connect pair controller?


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




## Wide angle camera
### 

## Focbox Electronic Speed Control
Get the [VESC Tool](https://vesc-project.com/vesc_tool). The free version is sufficient. The required Firmware [VESC_servoout.bin](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/VESC_servoout.bin) is available in the [vedderb/vesc_tool](https://github.com/vedderb/vesc_tool) github repository at [res/firmwares/410_o_411_o_412](https://github.com/vedderb/vesc_tool/blob/master/res/firmwares/410_o_411_o_412/)

## SparkFun 9DoF Razor IMU M0

## RPLidar A1M8

## Intel RealSense Depth Camera D435i
get a native Windows 10 installation and follow the [Intel update instructions](https://downloadcenter.intel.com/download/28481/Latest-Firmware-for-Intel-RealSense-D400-Product-Family?v=t)

Note: The Linux updater is made for linux x86 and thus cannot be executed on the Xavier





# Install Racecarx





# Setting up the hardware components




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
