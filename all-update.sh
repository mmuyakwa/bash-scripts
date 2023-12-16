#!/usr/bin/env bash

#title:         all-update.sh
#description:   This script keeps my (debian) docker-systems up to date.
#author:        Michael Muyakwa
#created:       2022-11-26
#updated:       2022-11-26
#version:       1.0
#license:       MIT
#usage:         ./all-update.sh
#==============================================================================

# Save current directory
PWD=$(pwd)

# Goto Script-Folder
cd "$HOME/scripts/bash-scripts" || exit

# Check if "git" is installed
if [ -x "$(command -v git)" ]; then
    echo "Pull GIT"
    # Update the "git".
    git pull origin master
fi

# Update System
sh update.sh

# Check if "docker" is installed
if [ -x "$(command -v docker)" ]; then
    echo "Update docker"
    # Check if Portainer is installed
    if [ "$(docker ps -a | grep -c portainer)" -gt 0 ]; then
        # Update Portainer-Container
        cd "installers/docker/portainer" || exit
        sh update_portainer.sh
    else
        echo "Portainer seems not to be installed."
    fi

fi

cd "$PWD" || exit
