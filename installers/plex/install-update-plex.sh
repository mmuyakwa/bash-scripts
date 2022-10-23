#!/usr/bin/env bash

# This script installs (or updates) Plex Media Server (PMS) on Debian-based Systems.
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2018-12-19
# License: MIT

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# This Part I got from https://github.com/ajclark/plex-auto-update

# Quick shell script to automatically download and install
# the latest version of Plex Media Server on Debian/Ubuntu.
#
# The filters look for Ubuntu (Debian in my case!) strings only
# but can easily be adapted to Fedora or MacOS if you're a pervert
# or hipster respectively.
#
# requirements: apt-get install curl jq
$SUDO apt-get install curl jq sqlite3 gdebi-core -y

# Insane JQ parsing to select both build AND distro. 
plex_url=$(curl -s https://plex.tv/pms/downloads/5.json | jq -r '.computer.Linux.releases[] | select((.build=="linux-x86_64") and .distro=="debian") .url')

# Download the latest version of plex and install it
curl -O $plex_url && $SUDO gdebi --n ${plex_url##*/}

# Run the following code to set your Keyboard-Language
# 'sudo dpkg-reconfigure keyboard-configuration'
