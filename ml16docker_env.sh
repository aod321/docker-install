#!/bin/bash
curl -fsSL https://raw.githubusercontent.com/aod321/docker-install/master/install.sh -o install.sh
sh install.sh --mirror
docker run -it --rm \
    -p 5600:5600/udp \
    --user=tanway \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    tanway/ml16_ros
