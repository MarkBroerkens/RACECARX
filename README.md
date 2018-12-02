# carai-mk-2
car.AI Second Edition

1:10 autonomous RC robocar.

Inspired by
* [MIT racecar](https://mit-racecar.github.io/)
* [Hypha-ROS racecar](https://github.com/Hypha-ROS/hypharos_racecar)
* [Racecar/J](https://racecarj.com/)
* [F1/10 Autonomous Racing Competition](http://f1tenth.org/)
* [Jetson racecar](https://www.jetsonhacks.com/category/robotics/jetson-racecar/)
* [eagleMK4](https://github.com/r7vme/eagleMK4)


# Components

| Component | Model | Comments |
| --------- | ----- | -------- |
| 1/10 RC chassis | [TRAXXAS Slash 4x4 Platinum](http://mobil.rc-race-shop.de/item/5452583638303452)  | 1:10 race car: only chassis and brushless motor are used. alternative:  [Hobbyking SCT Trooper 4x4](https://hobbyking.com/en_us/trooper-pro-4x4-1-10-brushless-sct-arr.html) |
| LiPo battery 3S | 2 x [ZIPPY Flightmax 5000mAh 3S1P 20C](https://hobbyking.com/en_us/zippy-flightmax-5000mah-3s1p-20c.html) | One for car, one for Jetson |
| LiPo voltage checker | [lipo voltage checker](https://hobbyking.com/en_us/hobbykingtm-lipo-voltage-checker-2s-8s.html) | |
| LiPo charger | [IMax B6AC V2 Balance Charger](https://www.amazon.de/VINGO®ORIGINAL-Netzteil-Batterie-Balance-Ladegerät/dp/B01AXVI6YW/ref=sr_1_1?ie=UTF8&qid=1540673676&sr=8-1&keywords=IMAX+Balance+Charger) | |
| Compute module  | [Nvidia Jetson AGX Xavier Development Kit](https://developer.nvidia.com/embedded/buy/jetson-xavier-devkit) | register for the Nvidia developmenter program for special discount. [Slides from Webinar](https://github.com/dusty-nv/jetson-presentations/raw/master/20181004_Jetson_AGX_Xavier_New_Era_Autonomous_Machines.pdf), [Nvidia Forum](https://devtalk.nvidia.com/default/topic/1039020/jetson-agx-xavier/links-to-jetson-xavier-resources-amp-wiki/)|
| ESC | [Enertion FOCBOX](https://electricboardsolutions.com/products/enertion-focbox)| alternative: [Turnigy SK8-ESC V4.12](https://hobbyking.com/de_de/turnigy-sk8-esc-v4-12-for-electric-skateboard-conversion-w-bec.html)|
| Battery adapter | [HXT 4mm bis XT-60 Batterie-Adapter](https://hobbyking.com/de_de/hxt-4mm-to-xt-60-battery-adapter-2pcs-bag.html) | required to connect FOCBOX with Zippy Lipo |
| SSD |  [Samsung 970 EVO 500GB, M2 2280](https://www.mindfactory.de/product_info.php/500GB-Samsung-970-Evo-M-2-2280-NVMe-PCIe-3-0-x4-32Gb-s-3D-NAND-TLC--MZ-_1246504.html)|  M.2 Key M HDD|
| USB Wifi | [TP-Link TL-WN823N N300 Mini WLAN USB Adapter](https://www.amazon.de/gp/product/B0088TKTY2) | can run in Access Point mode|
| 10x USB 3.0 hub | [ORICO 40W 10 Ports USB 3.0 hub](https://www.amazon.de/gp/product/B075QZ88DM) | |
| usb c to usb b adapter | [USB 3.1 Type C (USB-C) auf Type B (USB-B) Kable](https://www.amazon.de/gp/product/B00UXKTJE0) | |
| 2D Lidar | [Slamtec RPLidar A1M8](https://www.exp-tech.de/sensoren/entfernungnaeherung/8946/rplidar-a1m8-360-degree-laser-scanner-kit-12m) | |
| IMU | [SparkFun MPU-9250 9DoF Razor IMU M0](https://eckstein-shop.de/SparkFun-9DoF-Razor-IMU-M0-MPU-9250) | |
| Camera | [OpenMV Cam M7](https://www.mybotshop.de/OpenMV-Cam-M7) with [fesheye lens](https://www.mybotshop.de/OpenMV-Kameraobjektiv-Ultra-Wide-Angle-Objektiv)| |
| | ? [Intel realsense D435](https://www.voelkner.de/products/1102651/Intel-RealSense-Depth-Camera-D435-Full-HD-Webcam-1920-x-1080-Pixel-Klemm-Halterung-Standfuss.html?ref=19&utm_source=idealo&utm_medium=CPC&utm_campaign=D748271) | |
| Hobby glass | 2 x [25cm x 50cm x 4mm](https://www.hornbach.de/shop/Hobbyglas-4x250x500-mm-Glatt-klar/1477845/artikel.html?WT.mc_ag=41053541180&gclid=EAIaIQobChMImYKWxoXb3gIV67DtCh0h6gKkEAQYASABEgITS_D_BwE&WT.srch=1&WT.mc_id=DE_P_BS_AW_766103971) | |
| M3 standoffs/nuts/etc. | [M3 Nylon Black Hex Screw Nut Spacer Standoff (260 pieces)](https://www.amazon.de/gp/product/B01MFF5XIC) | |
| controller | [DualShock 4 USB Wireless Adaptor](https://www.amazon.de/gp/product/B01KHFIO82) and [PlayStation 4 - DualShock 4 Wireless Controller](https://www.amazon.de/gp/product/B01GVQUX3U)| |


# Tools
* [iFixit Pro Tech Toolkit](https://www.amazon.de/gp/product/B01GF0KV6G)
* [iFixit Tragbar Elektroschocks Matte](https://www.amazon.de/gp/product/B01BLPBOS4)



