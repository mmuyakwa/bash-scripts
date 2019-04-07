#!/bin/bash

# https://github.com/strukturag/spreed-webrtc

git clone https://github.com/strukturag/spreed-webrtc.git

sleep 2

cd spreed-webrtc

#sudo snap install go --classic
sudo apt install nodejs golang-go autoconf automake -y

sh autogen.sh
./configure
make
make get
make assets
make binary
cp server.conf.in server.conf
sed -i -e 's/127.0.0.1/0.0.0.0/g' server.conf
./spreed-webrtc-server

echo "Spreed WebRTC is now running on http://hostname:8080"

