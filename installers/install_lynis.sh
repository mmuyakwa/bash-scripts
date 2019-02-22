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
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi


$SUDO apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C80E383C3DE9F082E01391A0366C67DE91CA5D5F
$SUDO wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | $SUDO apt-key add -

$SUDO apt install apt-transport-https

echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | $SUDO tee /etc/apt/sources.list.d/cisofy-lynis.list

$SUDO apt update
$SUDO apt install lynis
lynis show version
$SUDO lynis update info
$SUDO lynis audit system --auditor "Michael Muyakwa"