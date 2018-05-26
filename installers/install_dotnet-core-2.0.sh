#!/usr/bin/env bash

#title:         install_dotnet-core-2.0.sh
#description:   This script installs DotNET Core 2.0 ( https://www.microsoft.com/net/learn/get-started/linux/ubuntu16-04 ).
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-05-26
#updated:       N/A
#version:       0.4
#license:       MIT
#usage:         ./install_dotnet-core-2.0.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi


wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
$SUDO dpkg -i packages-microsoft-prod.deb

$SUDO apt-get install apt-transport-https -y
$SUDO apt-get update
$SUDO apt-get install dotnet-sdk-2.1.200 -y

rm packages-microsoft-prod.deb

