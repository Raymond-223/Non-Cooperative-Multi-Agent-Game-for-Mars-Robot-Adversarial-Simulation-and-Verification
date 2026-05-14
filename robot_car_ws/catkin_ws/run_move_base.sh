#!/bin/bash

#run ros demo
tmux new-session -s "NewPanel" -d -n "local"
#creat 4 panes in local-window
tmux split-window -v
tmux select-pane -U
tmux split-window -h
tmux select-pane -R
tmux split-window -h
tmux select-pane -L
tmux split-window -h
tmux select-pane -L
tmux split-window -h
tmux select-pane -D
tmux split-window -h
tmux select-pane -R
tmux split-window -h
tmux select-pane -L
tmux split-window -h
tmux select-pane -L
tmux split-window -h

#send all commands to each pane

### 


tmux send -t 0 "source /opt/ros/noetic/setup.bash" Enter
tmux send -t 0 "roscore" Enter

sleep 5



### 
tmux send -t 1 "conda deactivate" Enter
tmux send -t 1 "cd ~/catkin_ws" Enter
tmux send -t 1 "source devel/setup.sh" Enter
tmux send -t 1 "roslaunch ebot_bringup bringup.launch" Enter
#sleep 1
sleep 1

### 
tmux send -t 2 "conda deactivate" Enter
tmux send -t 2 "cd ~/catkin_ws" Enter
tmux send -t 2 "source devel/setup.bash" Enter
tmux send -t 2 "roslaunch ebot_bringup slam.launch" Enter

sleep 1

### 
tmux send -t 3 "conda deactivate" Enter
tmux send -t 3 "cd ~/catkin_ws" Enter
tmux send -t 3 "source devel/setup.bash" Enter
tmux send -t 3 "roslaunch ebot_bringup ebot_move_base2.launch" Enter

sleep 1
tmux send -t 4 "conda deactivate" Enter
tmux send -t 4 "cd ~/catkin_ws" Enter
tmux send -t 4 "source devel/setup.bash" Enter
#tmux send -t 4 "roslaunch control_mapping control_mapping.launch" Enter

sleep 1
tmux send -t 5 "conda deactivate" Enter
tmux send -t 5 "cd ~/catkin_ws" Enter
tmux send -t 5 "source devel/setup.bash" Enter
#tmux send -t 5 "roslaunch ebot_bringup velocity_smoother.launch" Enter


sleep 1
tmux send -t 6 "conda activate mqtt" Enter
tmux send -t 6 "cd ~/catkin_ws" Enter
tmux send -t 6 "source devel/setup.bash" Enter
tmux send -t 6 "roslaunch mqtt_bridge topicPass.launch" Enter

sleep 3
tmux send -t 7 "conda activate mqtt" Enter
tmux send -t 7 "cd ~/catkin_ws" Enter
tmux send -t 7 "source devel/setup.bash" Enter
tmux send -t 7 "rostopic pub /getready std_msgs/Bool true" Enter

sleep 1
tmux send -t 8 "conda activate mqtt" Enter
tmux send -t 8 "cd ~/catkin_ws" Enter
tmux send -t 8 "source devel/setup.bash" Enter
tmux send -t 8 "rostopic echo /launchsignal" Enter

sleep 2
tmux send -t 9 "conda activate mqtt" Enter
tmux send -t 9 "cd ~/catkin_ws" Enter
tmux send -t 9 "source devel/setup.bash" Enter
tmux send -t 9 "roslaunch ultrasonic_sensors ultrasonic_sensors.launch"


#sleep 10
#tmux send -t 5 "conda deactivate" Enter
#tmux send -t 5 "cd ~/catkin_ws" Enter
#tmux send -t 5 "source devel/setup.bash" Enter
#tmux send -t 5 "roslaunch ebot_bringup global_planner.launch" Enter


tmux -2 attach-session -d
