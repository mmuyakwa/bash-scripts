#!/usr/bin/env bash

## TODO add https://docs.docker.com/install/linux/linux-postinstall/ if SUDO-User
#sudo groupadd docker
#sudo usermod -aG docker $USER


#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "$HOME/.docker" -R

#sudo systemctl enable docker
#sudo systemctl restart docker

docker volume create portainer_data
docker run --name portainer --restart always -d -e TIME_ZONE="Europe/Berlin" -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo 'Portainer is now available on Port 9000'

echo 'Add templates from:'
## v1 echo 'https://raw.githubusercontent.com/SelfhostedPro/selfhosted_templates/master/Template/template.json'
## v2 echo 'https://github.com/dnburgess/self-hosted-template/raw/master/template.json'
echo 'https://raw.githubusercontent.com/dnburgess/dbtechtemplate/master/Template/v2/template.json' # v2
echo ''
