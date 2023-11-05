#!/usr/bin/env bash

# This script installs my usual suspects on Debian-based Systems.
# This Script is intended for systems WITHOUT a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2018-01-19
# License: MIT

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install my usual suspects
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install mc screen build-essential clamav software-properties-common locales-all curl git gdebi-core bc rename awscli apt-transport-https -y

# Set locale
$SUDO locale-gen de_DE.UTF-8
$SUDO update-locale LANG=de_DE.UTF-8

# Set Timezone to Berlin
$SUDO cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Run the following code to set your Keyboard-Language
# 'sudo dpkg-reconfigure keyboard-configuration'
