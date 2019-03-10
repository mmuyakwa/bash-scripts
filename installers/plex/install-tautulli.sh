#!/usr/bin/env bash

# This script installs Tautulli for Plex Media Server (PMS) on Debian-based Systems.
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2019-03-10
# License: MIT

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# Tautulli will be installed to /opt/Tautulli.

$SUDO apt-get install git-core -y

# Install prerequisites:
$SUDO apt-get install python python-setuptools tzdata -y

cd /opt
$SUDO git clone https://github.com/Tautulli/Tautulli.git
$SUDO addgroup tautulli && $SUDO adduser --system --no-create-home tautulli --ingroup tautulli
$SUDO chown tautulli:tautulli -R /opt/Tautulli
cd Tautulli

# python Tautulli.py to start Tautulli
# Tautulli will be loaded in your browser or listening on http://localhost:8181

# To run Tautulli in the background on startup, refer to Install as a daemon

$SUDO cp /opt/Tautulli/init-scripts/init.systemd /lib/systemd/system/tautulli.service

$SUDO systemctl daemon-reload
$SUDO systemctl enable tautulli.service

# Start now with the following command:
$SUDO systemctl start tautulli.service

echo "Tautulli will be listening on http://localhost:8181"