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
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update

$SUDO apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

$SUDO curl -fsSL https://download.docker.com/linux/debian/gpg | $SUDO apt-key add -

$SUDO add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

$SUDO apt-get update

$SUDO apt-get install docker-ce -y

$SUDO pip install docker-compose

$SUDO systemctl enable docker
