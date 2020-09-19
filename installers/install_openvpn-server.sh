#!/usr/bin/env bash

# This script installs openvpn-Access-Server.
# This Script is intended for systems WITHOUT a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2019-12-25
# License: MIT

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# See: https://openvpn.net/vpn-software-packages/#modal-items
$SUDO apt update && $SUDO apt -y install ca-certificates wget net-tools
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | $SUDO apt-key add -
$SUDO echo "deb http://as-repository.openvpn.net/as/debian stretch main">/etc/apt/sources.list.d/openvpn-as-repo.list
$SUDO apt update && apt -y install openvpn-as

echo "No run '$SUDO passwd openvpn'"
