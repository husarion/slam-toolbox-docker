# slam-toolbox-docker

Building a Docker image with SLAM Toolbox.

Available for ROS distros:
- ROS 2 galactic
- ROS 2 humble

Using in Docker Compose:

```yaml
  slam-toolbox:
    image: husarion/slam-toolbox:galactic 
    restart: unless-stopped
    container_name: slam-toolbox
    volumes: 
      - ./config/slam_params.yaml:/slam_params.yaml
      - ./maps:/maps
    command: >
      ros2 launch slam_toolbox online_sync_launch.py 
        slam_params_file:=/slam_params.yaml
```

Saving map:

```bash
docker exec -it slam-toolbox bash -c "source /opt/ros/galactic/setup.bash && ros2 run nav2_map_server map_saver_cli --fmt png -f current-map"
```