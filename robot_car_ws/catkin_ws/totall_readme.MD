#该步骤为设置权限每次开机需要设置，小车开机后,先cd catkin_ws 然后 bash serial.sh   bash teleop.sh  bash mqtt.sh  bash chao.sh

#建图的脚本只需执行       bash hecotr.bash  然后家在话题
#实现小车自动驾驶执行 	bash run_move_move.sh   小车的规划的调参:     sudo vim catkin_ws/src/ebot_bringup/param/move_base_config.yaml

#setup.sh是关于小车的依赖，自行查看



#串口修改  查看串口：cd /dev/serial/by-path/ 然后：ls ,选择你需要的串口  底盘串口修改：sudo vim ~/catkin_ws/src/turn_on_wheeltec_robot/launch/include/base_serial.launch  超声串口修改：sudo vim ~/catkin_ws/src/ultrasonic_sensors/launch/ultrasonic_sensor.launch   雷达串口修改：sudo vim ~/catkin_ws/src/ebot_bringup/launch/rplidar.launch



#目前只需将目录catkin_ws/src下的ultrasonic_sensors包复制到车的相同目录下编译：catkin_make
