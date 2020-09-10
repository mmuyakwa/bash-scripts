#!/usr/bin/env bash

# This script installs ansible on the system.
# Author: Michael Muyakwa, 2018-01-20
# License: MIT
#

# root is always user_id 0
SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# $SUDO apt-get update -y
# $SUDO apt-get install software-properties-common -y
# $SUDO apt-add-repository --yes --update ppa:ansible/ansible
# $SUDO apt-get update -y
# $SUDO apt-get install ansible -y
# $SUDO sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# $SUDO service ssh restart


$SUDO echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> etc/apt/sources.list:
$SUDO apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$SUDO apt update -y
$SUDO apt install ansible
