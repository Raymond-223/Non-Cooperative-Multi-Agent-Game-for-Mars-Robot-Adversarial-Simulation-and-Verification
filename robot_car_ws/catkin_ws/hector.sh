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



sleep 5



### 
tmux send -t 0 "conda deactivate" Enter
tmux send -t 0 "cd ~/catkin_ws" Enter
tmux send -t 0 "source devel/setup.sh" Enter
tmux send -t 0 "roslaunch ebot_bringup bringup.launch" Enter
#sleep 1
sleep 2

### 
tmux send -t 1 "conda deactivate" Enter
tmux send -t 1 "cd ~/catkin_ws" Enter
tmux send -t 1 "source devel/setup.bash" Enter
tmux send -t 1 "roslaunch ebot_bringup hector.launch" Enter

sleep 1

### 
tmux send -t 2 "conda deactivate" Enter
tmux send -t 2 "cd ~/catkin_ws" Enter
tmux send -t 2 "source devel/setup.bash" Enter
tmux send -t 2 "roslaunch ebot_bringup ebot_teleop.launch" Enter

