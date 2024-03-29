#!/usr/bin/env bash

#title:         install_lynis.sh
#description:   This script installs and executes lynis.
#author:        Michael Muyakwa
#created:       2019-02-22
#updated:       2019-02-22
#version:       1.2
#license:       MIT
#usage:         ./install_lynis.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }


$SUDO wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | $SUDO apt-key add -

$SUDO apt install apt-transport-https

echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | $SUDO tee /etc/apt/sources.list.d/cisofy-lynis.list

$SUDO apt update
$SUDO apt install lynis
lynis show version
$SUDO lynis update info
$SUDO lynis audit system --auditor "Michael Muyakwa"
