#!/bin/bash

## TODO add https://docs.docker.com/install/linux/linux-postinstall/ if SUDO-User
#sudo groupadd docker
#sudo usermod -aG docker $USER


#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "$HOME/.docker" -R

#sudo systemctl enable docker
#sudo systemctl restart docker

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

echo 'Portainer is now available on Port 9000'

