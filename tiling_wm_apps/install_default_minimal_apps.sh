#!/usr/bin/env bash

#title:         install_default_minimal_apps.sh
#description:   This script installs Powerline on the system.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2020-09-21
#updated:       -
#version:       0.8
#license:       MIT
#usage:         sh install_default_minimal_apps.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install dependencies (powerline and pip [python]) and needed Fonts.
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install qutebrowser pcmanfm -y
