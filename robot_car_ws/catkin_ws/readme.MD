# 编译源码报错
若编译过程中出现CMake Error (***Config.cmake / ***-config.cmake) 是因为缺少对应的依赖包
sudo apt-get update
sudo apt-get install ros-melodic-***

若下载依赖包报错，在确定网络环境正常的情况下可尝试更换镜像源
sudo vim /etc/apt/sources.list
将文件内容替换，以下以清华镜像源为例
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse

sudo vim /etc/apt/sources.list.d/ros-latest.list
将文件内容替换，以下以清华镜像源为例
deb https://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ bionic main

# movebase依赖 
tmux, yocs_velocity_smoother
sudo apt-get install tmux
sudo apt-get install ros-melodic-yocs-velocity-smoother
sudo apt-get install ros-melodic-yocs*

sudo apt install ros-melodic-navigation
sudo apt-get install ros-melodic-teb-local-planner
（rosdep install  teb_local_planner）

# odometry依赖
sudo apt-get install ros-melodic-mrpt2

# mqtt_bridge依赖
mqtt功能包源码在src/mqtt_bridge-master，依赖安装见项目地址：https://gitcode.com/groove-x/mqtt_bridge/overview?utm_source=csdn_github_accelerator
已经配置好的上下行通信topic参数见src/mqtt_bridge-master/config/test_param.yaml


# 安装完mqtt和movebase的依赖后，进行启动
远程ssh登录   bash run_move_base.sh(需要修改传感器的对应启动文件和端口号)
远程export ROS_MASTER_URI='http://192.168.XXX.XXX:11311'    rviz -d remote_ebot.rviz（需要配置主从机hosts文件）
rviz上给起始位姿
rviz上给规划终点进行规划

# 模块
ebot_move_base.launch 运行move_base全局、局部地图，全局、局部规划
# 未启用，调试时可以使用
velocity_smoother.launch yocs速度平滑
control_mapping.launch 输出角速度映射(按比例放大)

# 关键参数
~/catkin_ws/src/ebot_bringup/param/teb_local_planner_params.yaml    move_base功能包内规划参数
~/catkin_ws/src/ebot_bringup/param/move_base_params.yaml    move_base功能包控制参数
~/catkin_ws/src/ebot_bringup/save_map.sh    map_server保存地图路径及名称
~/catkin_ws/src/ebot_bringup/launch/slam.launch     新建地图后更改地图配置
~/catkin_ws/src/ebot_bringup/launch/rplidar.launch      配置激光雷达通信串口
~/catkin_ws/src/turn_on_wheeltec_robot/launch/include/base_serial.launch    配置底盘通信串口
~/catkin_ws/run_move_base.sh    编辑小车启动launch文件
~/catkin_ws/remote_ebot.rviz    编辑rviz文件
