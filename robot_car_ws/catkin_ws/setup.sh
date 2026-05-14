#!/bin/bash

#mqtt-bridge-intall
sudo apt install python3-pip
sudo apt install ros-noetic-rosbridge-library
sudo apt install mosquitto mosquitto-clients
cd catkin_ws/src/mqtt_bridge-master
pip install pymongo
pip3 install --no-index --find-links=./offline_packages -r dev-requirements.txt


#ros-dependency-install
sudo apt install ros-noetic-tf
sudo apt install ros-noetic-tf2
sudo apt install ros-noetic-tf2-ros
sudo apt install ros-noetic-navigation
sudo apt install ros-noetic-gmapping
sudo apt install ros-noetic-hector-mapping
sudo apt install ros-noetic-move-base
sudo apt install ros-noetic-serial
sudo apt install ros-noetic-geographic-msgs
sudo apt install ros-noetic-tf2-sensor-msgs


# Assuming you have sourced the ros environment, same below
camsra
source /opt/ros/noetic/setup.bash
sudo apt install libgflags-dev  
sudo apt install ros-$ROS_DISTRO-image-geometry 
sudo apt install ros-$ROS_DISTRO-camera-info-manager
sudo apt install ros-$ROS_DISTRO-image-transport 
sudo apt install ros-$ROS_DISTRO-image-publisher  
sudo apt install libusb-1.0-0-dev 
sudo apt install libeigen3-dev
sudo apt install ros-$ROS_DISTRO-backward-ros 
sudo apt install libdw-dev
sudo apt install libglog
cd ~/catkin_ws
git clone https://github.com/libuvc/libuvc.git
cd libuvc
mkdir build && cd build
cmake .. && make -j4
sudo make install
sudo ldconfig
cd ~/catkin_ws/src/ebot_sensor
git clone https://github.com/orbbec/ros_astra_camera.git

#ydlidar#sudo apt install cmake pkg-config
sudo apt-get install python swig
sudo apt-get install python3-pip
cd ~/catkin_ws/src/ebot_sensor/ydlidar_ros_driver/YDLidar-SDK
mkdir build
cd build
cmake ..
make
sudo make install








