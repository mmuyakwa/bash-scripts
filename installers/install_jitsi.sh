#!/bin/bash

wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
sudo apt-get -y update
sudo apt-get -y install jitsi-meet


echo ""
echo "To install LetsEncrypt run:"
echo "/usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh"

