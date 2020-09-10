#!/usr/bin/env bash

# This script installs "Spreed WebRTC"-Server (Video WebChat) on Debian-based Systems.
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2019-04-07
# License: MIT

# https://github.com/strukturag/spreed-webrtc

# root is always user_id 0
SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

git clone https://github.com/strukturag/spreed-webrtc.git
sleep 2

cd spreed-webrtc

#sudo snap install go --classic
$SUDO apt install nodejs golang-go autoconf automake -y

sh autogen.sh
./configure
make
make get
make assets
make binary
cp server.conf.in server.conf
# Edit server.conf "listen = 127.0.0.1:8080" to "listen = 0.0.0.0:8080" to allow external access.
sed -i -e 's/127.0.0.1/0.0.0.0/g' server.conf
./spreed-webrtc-server

echo "Spreed WebRTC is now running on http://hostname:8080"

