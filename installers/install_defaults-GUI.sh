#!/usr/bin/env bash

# This script installs my usual suspects on Debian-based Systems.
# This Script is intended for systems WITH a GUI
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2018-01-19
# License: MIT

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# Set Timezone to Berlin
$SUDO cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Install my usual suspects
$SUDO apt-get install filezilla remmina mc screen build-essential software-properties-common gdebi redshift-gtk retext locales-all curl git libavcodec-extra gksudo libavcodec-extra p7zip-full p7zip-rar ffmpeg rename awscli -y

$SUDO add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
$SUDO add-apt-repository ppa:obsproject/obs-studio -y

$SUDO apt-get update
$SUDO apt-get install simplescreenrecorder -y
$SUDO apt-get install obs-studio -y

# Download Google-Chrome DEB.
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
$SUDO dpkg -i google-chrome-stable_current_amd64.deb > /dev/null 2>&1
if [ $? -gt 0 ]; then
# Download missing dependencies for Google-Chrome.
    $SUDO apt-get -f --force-yes --yes install > /dev/null 2>&1
fi
$SUDO dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
