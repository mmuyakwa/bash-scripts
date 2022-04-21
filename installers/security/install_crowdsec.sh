#!/usr/bin/env bash

# This script installs CrowdSEC.
# This Script is intended for systems WITHOUT a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2022-04-21
# License: MIT

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Download repository
curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | $SUDO bash

# Install CrowdSEC
$SUDO apt install crowdsec -y

# Install the bouncer
$SUDO apt install crowdsec-firewall-bouncer-iptables -y

# Update the information for CrowdSEC
$SUDO cscli hub update
$SUDO cscli hub upgrade

# Show triggert events
$SUDO cscli decisions list
