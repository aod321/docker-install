#!/bin/bash  
set_mirror(){
sh -c "echo '{' > /etc/docker/daemon.json"
sh -c "echo  '\t\"registry-mirrors\": [\"https://docker.mirrors.ustc.edu.cn/\"]' >> /etc/docker/daemon.json" 
sh -c "echo  '}' >> /etc/docker/daemon.json"
sh -c "systemctl restart docker"
}
set_mirror
