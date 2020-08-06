#!/usr/bin/env bash

# This script installs ansible on the system.
# Author: Michael Muyakwa, 2018-01-20
# License: MIT
#

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update -y
$SUDO apt-get install software-properties-common -y
$SUDO apt-add-repository --yes --update ppa:ansible/ansible
$SUDO apt-get update -y
$SUDO apt-get install ansible -y
$SUDO sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
$SUDO service ssh restart
