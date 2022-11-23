docker run -it --rm --privileged --workdir=/colcon_ws \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_custom_interfaces:/colcon_ws/src/dynamixel_sdk_custom_interfaces \
--volume /dev:/dev \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_examples:/colcon_ws/src/dynamixel_sdk_examples \
--net=host ghcr.io/rosblox/ros-dynamixel:humble
