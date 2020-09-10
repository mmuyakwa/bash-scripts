#!/bin/bash

# https://github.com/balena-io/etcher#debian-and-ubuntu-based-package-repository-gnulinux-x86x64 

SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

echo "deb https://deb.etcher.io stable etcher" | $SUDO tee /etc/apt/sources.list.d/balena-etcher.list
$SUDO apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
$SUDO apt-get update
$SUDO apt-get install balena-etcher-electron -y

