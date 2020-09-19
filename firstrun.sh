#!/usr/bin/env bash

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }


#if [ -f /etc/redhat-release ]; then
#  yum update
#fi

#if [ -f /etc/lsb-release ]; then
#  apt-get update
#fi


$SUDO apt-get update -y
$SUDO apt-get install git -y

# Set locale
$SUDO locale-gen de_DE.UTF-8
$SUDO update-locale LANG=de_DE.UTF-8

# Set Timezone to Berlin
$SUDO cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

cd || exit
if [ ! -d "scripts" ]; then
    mkdir scripts
fi

cd scripts || exit

if [ ! -d "bash-scripts" ]; then
    git clone https://github.com/mmuyakwa/bash-scripts.git
    cd bash-scripts || exit
else
    cd bash-scripts || exit
    git pull origin master
fi


sh update.sh

sh installers/install_defaults-Non_GUI.sh
sh sshd/configure-sshd-minimum.sh

cd installers/powerline/ || exit
sh install_powerline.sh

# Uninstall exim4 - port 25
$SUDO apt purge exim4-base exim4-config rpcbind -y


# Install "has" - https://github.com/kdabir/has
cd /tmp/ || exit
git clone https://github.com/kdabir/has.git && cd has && $SUDO make install
