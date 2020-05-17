---
permalink: /docs/software/jetson_docker
title: "Software Setup - Docker on Jetson Xavier"
toc: true
---


## Login to NGC docker registry
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

## Get the installation scripts

```bash
mkdir ~/racecarx
cd ~/racecarx
git clone https://github.com/MarkBroerkens/RACECARX.git
```

## Build docker container
```bash
cd RACECARX/jetson/docker
sudo make build
```

The docker image supports the following features:

1. Nvidia base image: l4t-base
2. ROS
3. Realsense camera


## Initial setup
```bash
cd ~/racecarx/RACECARX
./installRACECARX_Xavier.sh
```


# Run the docker container in interactive mode

```bash
~/racecarx/RACECARX/racecarx.sh
```


