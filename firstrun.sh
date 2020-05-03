#!/bin/bash

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi




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

cd
if [ ! -d "scripts" ]; then
    mkdir scripts
fi

cd scripts

if [ ! -d "bash-scripts" ]; then
    git clone https://github.com/mmuyakwa/bash-scripts.git
    cd bash-scripts
else
    cd bash-scripts
    git pull origin master
fi

sh update.sh

sh installers/install_defaults-Non_GUI.sh

cd installers/powerline/
sh install_powerline.sh
