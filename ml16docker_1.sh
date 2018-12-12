#!/bin/bash
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }
command_exists() {
        command -v "$@" > /dev/null 2>&1
}

sh_c='sh -c'
if [ "$user" != 'root' ]; then
    if command_exists sudo; then
       sh_c='sudo -E sh -c'
    elif command_exists su; then
       sh_c='su -c'
    else
       exit 1
     fi
fi
if [ $1x == "init"x ]; then
  if ! command_exists docker; then
    curl -sSL https://get.daocloud.io/docker | sh
  fi
    $sh_c 'docker run -it  --name="tanway_ml16ros"\
    -p 5600:5600/udp \
    --user="tanway" \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    tanway/ml16_ros'
else
   $sh_c 'docker start tanway_ml16ros'
   $sh_c 'docker exec -it tanway_ml16ros /bin/bash'
fi
