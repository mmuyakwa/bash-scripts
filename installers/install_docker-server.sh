#!/usr/bin/env bash

#title:         install_docker-server.sh
#description:   This script installs Docker on a Server.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-12-13
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_docker-server.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt-get update

$SUDO apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common python-pip -y

$SUDO curl -fsSL https://download.docker.com/linux/debian/gpg | $SUDO apt-key add -

$SUDO add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

$SUDO apt-get update

$SUDO apt-get install docker-ce -y

$SUDO systemctl enable docker

# Add user to "docker"-group
[ "$(id -u)" -ne 0 ] && { sudo usermod -aG docker "$USER"; echo "You need to logout and back in to access docker."; }

#$SUDO pip install docker-compose
$SUDO curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$SUDO chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Create folder for my docker-compose files.
if [ ! -d "$HOME/scripts/Docker" ]; then
    mkdir -p "$HOME/scripts/Docker"
fi
