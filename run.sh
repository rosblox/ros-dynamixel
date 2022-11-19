docker run -it --privileged --rm --workdir=/colcon_ws \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_examples:/colcon_ws/src/dynamixel_sdk_examples \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_custom_interfaces:/colcon_ws/src/dynamixel_sdk_custom_interfaces \
--net=host ghcr.io/rosblox/ros-dynamixel:humble
