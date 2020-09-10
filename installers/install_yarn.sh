#!/usr/bin/env bash

#title:         install_yarn.sh
#description:   This script installs YARN ("https://yarnpkg.com").
#author:        Michael Muyakwa
#created:       2018-01-23
#updated:       N/A
#version:       0.6
#license:       MIT
#usage:         install_yarn.sh
#==============================================================================

SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt-get update && sudo apt-get install curl -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | $SUDO apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | $SUDO tee /etc/apt/sources.list.d/yarn.list

$SUDO apt-get update && sudo apt-get install yarn -y
