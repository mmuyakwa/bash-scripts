#!/usr/bin/env bash

# This script installs my usual suspects on Debian-based Systems.
# This Script is intended for systems WITHOUT a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2018-01-19
# License: MIT

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# Install my usual suspects
$SUDO apt-get install mc screen build-essential software-properties-common locales-all curl git gdebi-core rename awscli -y
# Set Timezone to Berlin
$SUDO cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Run the following code to set your Keyboard-Language
# 'sudo dpkg-reconfigure keyboard-configuration'
