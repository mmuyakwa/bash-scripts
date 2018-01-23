#!/usr/bin/env bash

#title:         update.sh
#description:   This script is for lazy people who want to keep their Debian-based system up to date.
#author:        Michael Muyakwa
#created:       2018-01-04
#updated:       2018-01-19
#version:       1.4
#license:       MIT
#usage:         ./update.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update -y
$SUDO apt-get upgrade -y
$SUDO apt-get dist-upgrade -y
$SUDO apt-get autoremove -y
$SUDO apt-get autoclean -y
