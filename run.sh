#!/bin/bash

REPOSITORY_NAME="$(basename "$(dirname -- "$( readlink -f -- "$0"; )")")"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export HOST_UID=$(id -u)

docker compose -f $SCRIPT_DIR/docker-compose.yml run \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_examples:/colcon_ws/src/dynamixel_sdk_examples \
--volume $(pwd)/DynamixelSDK/dynamixel_sdk_custom_interfaces:/colcon_ws/src/dynamixel_sdk_custom_interfaces \
${REPOSITORY_NAME} bash
