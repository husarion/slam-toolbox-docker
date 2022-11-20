ARG ROS_DISTRO=galactic

FROM husarnet/ros:$ROS_DISTRO-ros-core

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y && apt install -y \
        ros-$ROS_DISTRO-slam-toolbox && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./slam_params /slam_params

WORKDIR /maps

RUN echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc