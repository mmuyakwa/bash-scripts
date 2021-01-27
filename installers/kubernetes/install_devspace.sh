#!/usr/bin/env bash

#title:         install_devspace.sh
#description:   This script installs DevSpace.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2021-01-27
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_devspace.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

curl -s -L "https://github.com/loft-sh/devspace/releases/latest" | sed -nE 's!.*"([^"]*devspace-linux-amd64)".*!https://github.com\1!p' | xargs -n 1 curl -L -o devspace && chmod +x devspace;
$SUDO install devspace /usr/local/bin;

echo "Information on how to use:"
echo "https://devspace.sh/cli/docs/getting-started/initialize-project"
