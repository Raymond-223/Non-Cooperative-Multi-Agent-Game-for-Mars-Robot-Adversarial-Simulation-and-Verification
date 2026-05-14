# Docker Image: test_noetic:withdata

Pre-built ROS Noetic Docker image for the ebot robot car (aarch64/Jetson).

## Reassemble

```bash
cd robot_car_ws/docker_image
bash reassemble.sh
```

## Load

```bash
sudo gunzip -c test_noetic_withdata_aarch64.tar.gz | sudo docker load
```

## Build from Source

Alternatively, build the image from the workspace files in `robot_car_ws/catkin_ws/` and `robot_car_ws/docker_noetic/`.

