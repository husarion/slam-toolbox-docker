ARG ROS_DISTRO=galactic

FROM ros:$ROS_DISTRO-ros-core

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y && apt install -y \
        ros-$ROS_DISTRO-rmw-fastrtps-cpp \
        ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
        ros-$ROS_DISTRO-slam-toolbox && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./slam_params /slam_params

WORKDIR /maps

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

RUN echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc