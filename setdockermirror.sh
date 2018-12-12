#!/bin/bash  
set_mirror(){
echo -e "{" > /etc/docker/daemon.json
echo -e "\t\"registry-mirrors\": [\"https://docker.mirrors.ustc.edu.cn/\"]" >> /etc/docker/daemon.json 
echo -e "}" >> /etc/docker/daemon.json
systemctl restart docker
}
set_mirror
