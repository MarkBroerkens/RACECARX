![Deploy Website](https://github.com/MarkBroerkens/RACECARX/workflows/Deploy%20Website/badge.svg)

# RACECAR/X


1:10 autonomous RC robocar that is controlled by NVIDIA AGX Xavier.
Please find furher documentation on the [RACECARX website](https://markbroerkens.github.io/RACECARX/docs/)

![RACECAR/X](RACECARX.jpg)

## Capabilities
* Teleoperation
* Autonomous navigation

## Used technologies
* Docker
* ROS Melodic
* NVidia Xavier
* VESC speed controller
* Intel realsense d435i depth camera
* RPLidar A1 2D laser scanner
* IMU

## Structure of this repository

* [docs](docs) source of the website [RACECARX website](https://markbroerkens.github.io/RACECARX/).
* [hardware](hardware) hardware related resources such as laser cutter descriptions of the platforms
* [software](software) scripts for setting up the software on the Nvidia Jetson and on the PC host 

## Contribution Guide
You are very welcome to contribute to the project. E.g. by 

* reporting an issue via the [github issue](issues) tracker 
* creating a [pull](pulls) request. 

The [Udacity Git Commit Message Style Guide](http://udacity.github.io/git-styleguide/) apply.

The [github workflow](.github/workflows/deploy_website.yml) automatically builds and deploys the website into the [gh-pages](https://github.com/MarkBroerkens/RACECARX/tree/gh-pages) branch. 

You can build the site locally: `bundle exec jekyll build -s docs -d _site`.


## License
The content of this repository is licensed under a [MIT](LICENSE) License



