#!/usr/bin/env bash

#title:         install_docker-compose.sh
#description:   This script installs "docker-compose" https://github.com/docker/compose/ 
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2020-10-08
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_docker-compose.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

DESTINATION='/usr/local/bin/docker-compose'

$SUDO apt-get remove docker-compose -y
$SUDO pip uninstall docker-compose
#[ -f "$DESTINATION" ] && { $SUDO rm "$DESTINATION"; } # or
if [ -f "$DESTINATION" ]; then
    $SUDO rm "$DESTINATION"
fi

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install jq -y

compose_version="$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)"
$SUDO curl -L https://github.com/docker/compose/releases/download/"$compose_version"/docker-compose-"$(uname -s)"-"$(uname -m)" -o "$DESTINATION"
$SUDO chmod 755 "$DESTINATION"
$SUDO chmod +x "$DESTINATION"
docker-compose --version
