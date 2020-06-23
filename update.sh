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

# Check if another process is already running a apt/dpkg-instance.
locked=$($SUDO lsof -e /run/user/1000/gvfs /var/lib/dpkg/lock | wc -l);

if [ $locked -eq 0 ]; then

    $SUDO apt-get update -y

    # List available new Packages
    $SUDO apt list --upgradeable

    $SUDO apt-get upgrade -y
    $SUDO apt-get dist-upgrade -y
    $SUDO apt-get autoremove -y
    $SUDO apt-get autoclean -y

    # List packages which where installed today
    $SUDO cat /var/log/dpkg.log | grep "^$(date +%Y-%m-%d).*\ installed\ "

else
    echo "Another process is already running updates.";
    echo "Run this script at a later time again.";
fi