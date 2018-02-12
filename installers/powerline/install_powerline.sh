#!/usr/bin/env bash

# This script installs Powerline on the system.
# ( https://github.com/b-ryan/powerline-shell )
# Author: Michael Muyakwa, 2018-02-12
# License: MIT
#

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# Install dependencies (powerline and pip [python]) and needed Fonts.
$SUDO apt-get install powerline fonts-powerline python-pip -y

# Install "powerline-shell"
$SUDO pip install powerline-shell

# Use my config for Powerline in current profile
cp powerline-shell.json ~/.powerline-shell.json

# Add powerline-shell to bashrc
cat bashrc >> ~/.bashrc
# Add powerline-shell to bashrc for all
$SUDO cat bashrc >> /etc/bash.bashrc
