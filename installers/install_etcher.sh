#!/bin/bash

# https://github.com/balena-io/etcher#debian-and-ubuntu-based-package-repository-gnulinux-x86x64 

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install balena-etcher-electron -y

