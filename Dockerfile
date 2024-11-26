FROM ros:humble-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-colcon-common-extensions \
    ros-humble-dynamixel-sdk \
    && rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh .

WORKDIR /colcon_ws

COPY DynamixelSDK/dynamixel_sdk_examples src/dynamixel_sdk_examples
COPY DynamixelSDK/dynamixel_sdk_custom_interfaces src/dynamixel_sdk_custom_interfaces

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
    colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --event-handlers console_direct+

ENV LAUNCH_COMMAND='ros2 run dynamixel_sdk_examples velocity_interface_node'

# Create build and run aliases
RUN echo 'alias build="colcon build --symlink-install --event-handlers console_direct+ "' >> /etc/bash.bashrc && \
    echo 'alias run="su - ros --whitelist-environment=\"ROS_DOMAIN_ID\" /run.sh"' >> /etc/bash.bashrc && \
    echo "source /colcon_ws/install/setup.bash; echo UID: $UID; echo ROS_DOMAIN_ID: $ROS_DOMAIN_ID; $LAUNCH_COMMAND" >> /run.sh && chmod +x /run.sh
