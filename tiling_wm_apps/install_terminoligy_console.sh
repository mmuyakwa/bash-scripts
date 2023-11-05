#!/usr/bin/env bash

#title:         install_terminoligy_console.sh
#description:   This script installs the "Terminology"-console on the system.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2020-09-21
#updated:       -
#version:       0.8
#license:       MIT
#usage:         sh install_terminoligy_console.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install dependencies (powerline and pip [python]) and needed Fonts.
$SUDO add-apt-repository ppa:enlightenment-git/ppa

$SUDO apt-get update

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install terminology -y

gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminology
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
