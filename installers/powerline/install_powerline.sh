#!/usr/bin/env bash

# This script installs Powerline on the system.
# ( https://github.com/b-ryan/powerline-shell )
# Author: Michael Muyakwa, 2018-02-12
# License: MIT
#

# root is always user_id 0
SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install dependencies (powerline and pip [python]) and needed Fonts.
$SUDO apt-get install powerline fonts-powerline python-pip python3-pip -y

# Check-PIP-version
which pip
RESULT=$?

# Install "powerline-shell"
if [ $RESULT -eq 0 ]; then
  $SUDO pip install powerline-shell
else
  $SUDO pip3 install powerline-shell
fi


# Use my config for Powerline in current profile
cp powerline-shell.json ~/.powerline-shell.json

# Add powerline-shell to bashrc
cat bashrc >> ~/.bashrc
# Add powerline-shell to bashrc for all
$SUDO cat bashrc >> /etc/bash.bashrc
