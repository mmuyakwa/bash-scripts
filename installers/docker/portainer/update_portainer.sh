#!/usr/bin/env bash

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }


$SUDO docker pull portainer/portainer-ce
$SUDO docker stop portainer
$SUDO docker rm portainer
$SUDO docker run --name portainer --restart always -d -e TIME_ZONE="Europe/Berlin" -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
