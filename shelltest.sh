#!/bin/bash
if [ $1x == "init"x ]; then
    curl -fsSL https://raw.githubusercontent.com/aod321/docker-install/master/install.sh -o install.sh
    sh install.sh --mirror
    docker run -it  --name="tanway_ml16ros"\
    -p 5600:5600/udp \
    --user="tanway" \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    tanway/ml16_ros
else
    docker start tanway_ml16ros
    docker exec -it tanway_ml16ros /bin/bash
fi
