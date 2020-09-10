#!/bin/sh -xu

SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install Java with Desktop-client
#sudo apt-get install default-jdk -y

# Install Java on headless-client
$SUDO apt-get install default-jdk-headless -y

# 1. Import signing keys
curl -fsSL "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub" | $SUDO apt-key add "-"

# 2. Add deb repository to sources.list
echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" | $SUDO tee /etc/apt/sources.list.d/filebot.list

# 3. Update package index
$SUDO apt-get update

# 4. Install FileBot and its dependencies
$SUDO apt-get install apt-transport-https -y
$SUDO apt-get install filebot #--install-suggests

$SUDO apt install libmediainfo0v5 -y # Prevent: Unable to load amd64 (64-bit) native library libmediainfo.so

#####NEWS!

# It's easier to install the legacy-Version, which is free of charge.
# AMD64 https://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_amd64.deb
# i386 https://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_i386.deb
# Raspberry Pi - Download "filebot_4.7.9_armhf.deb" from http://r-massive.cellarseer.com/filebot-4-7-9-legacy-build-archive/ 


# Set your Password for OpenSubtitle.org
# filebot -script fn:configure
