FROM ros:humble-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-colcon-common-extensions \
    ros-humble-dynamixel-sdk ros-humble-dynamixel-sdk-custom-interfaces \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /colcon_ws/src

COPY DynamixelSDK/dynamixel_sdk_examples dynamixel_sdk_examples
COPY DynamixelSDK/dynamixel_sdk_custom_interfaces dynamixel_sdk_custom_interfaces

WORKDIR /colcon_ws

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install

WORKDIR /

COPY resources/ros_entrypoint.sh .

RUN echo 'alias build="colcon build --cmake-args --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'alias run="ros2 run dynamixel_sdk_examples velocity_interface_node"' >> ~/.bashrc
