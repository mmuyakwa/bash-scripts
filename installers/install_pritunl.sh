#!/usr/bin/env bash

# This script installs openvpn-Access-Server.
# This Script is intended for systems WITHOUT a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2019-12-25
# License: MIT

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO tee /etc/apt/sources.list.d/mongodb-org-4.0.list << EOF
deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main
EOF

$SUDO tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt stretch main
EOF

$SUDO apt-get install dirmngr
$SUDO apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
$SUDO apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
$SUDO apt-get update
$SUDO apt-get --assume-yes install pritunl mongodb-server
$SUDO systemctl start mongodb pritunl
$SUDO systemctl enable mongodb pritunl

echo "Now run 'pritunl setup-key'"
echo "Set your Password: '$SUDO pritunl default-password'"
echo "Then open http://localhost"
echo "Login with:"
echo "user:pritunl"
