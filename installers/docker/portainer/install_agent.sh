#!/usr/bin/env bash

## TODO add https://docs.docker.com/install/linux/linux-postinstall/ if SUDO-User
#sudo groupadd docker
#sudo usermod -aG docker $USER

docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent

echo 'Portainer is now available on Port 9000'
