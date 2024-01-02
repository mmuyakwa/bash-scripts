#!/usr/bin/env bash

#title:         install_powerline.sh
#description:   This script installs Powerline on the system.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-02-12
#updated:       2020-09-21
#version:       1.8
#license:       MIT
#usage:         sh install_powerline.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install dependencies (powerline and pip [python]) and needed Fonts.
$SUDO apt-get install powerline fonts-powerline python3-pip -y

# Install "powerline-shell"
$SUDO pip3 install powerline-shell

# Use my config for Powerline in current profile
cp powerline-shell.json ~/.powerline-shell.json

# Add powerline-shell to bashrc
cat bashrc >> ~/.bashrc
# Add powerline-shell to bashrc for all
$SUDO cat bashrc >> /etc/bash.bashrc
