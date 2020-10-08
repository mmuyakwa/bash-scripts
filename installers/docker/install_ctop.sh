#!/usr/bin/env bash

#title:         install_ctop.sh
#description:   This script installs "ctop" https://ctop.sh/ 
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2020-10-04
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_ctop.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO wget https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop
$SUDO chmod +x /usr/local/bin/ctop

echo "Execute 'ctop' to manage Docker-Containers."
