#!/usr/bin/env bash

#title:         install_docker-server.sh
#description:   This script installs Docker on a Server.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-12-13
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_docker-server.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && {
    SUDO='sudo'
    echo "Your not root."
    echo "Running commands with SUDO."
}

# Pakete die zur Installation benötigt werden installieren

$SUDO apt update
$SUDO apt install ca-certificates curl gnupg apt-transport-https gpg

# GPG-Key downloaden und Repository hinterlegen im System

$SUDO curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg
$SUDO echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null
$SUDO apt update

# Docker-Pakete installieren

$SUDO apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Prüfe ob der Befehl "$SUDO systemctl is-active docker", "active" zurückgibt. Wenn ja, dann ist Docker installiert und läuft.
if [ "$($SUDO systemctl is-active docker)" = "active" ]; then
    echo "Docker is installed and running."
else
    echo "Docker is not installed or not running."
fi

# Add user to "docker"-group
[ "$(id -u)" -ne 0 ] && {
    sudo usermod -aG docker "$USER"
    echo "You need to logout and back in to access docker."
}

# Create folder for my docker-compose files.
if [ ! -d "$HOME/scripts/Docker" ]; then
    mkdir -p "$HOME/scripts/Docker"
fi
