#!/bin/sh -xu


# Install Java with Desktop-client
#sudo apt-get install default-jre -y

# Install Java on headless-client
sudo apt-get install default-jre-headless -y

# 1. Import signing keys
curl -fsSL "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub" | apt-key add "-"

# 2. Add deb repository to sources.list
echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" | tee /etc/apt/sources.list.d/filebot.list

# 3. Update package index
apt-get update

# 4. Install FileBot and its dependencies
apt-get install apt-transport-https -y
apt-get install filebot #--install-suggests


#####NEWS!

# It's easier to install the legacy-Version, which is free of charge.
# AMD64 http://sourceforge.mirrorservice.org/f/project/fi/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_amd64.deb
# i386 http://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_i386.deb
# Raspberry Pi - Download "filebot_4.7.9_armhf.deb" from http://r-massive.cellarseer.com/filebot-4-7-9-legacy-build-archive/ 


# Set your Password for OpenSubtitle.org
# filebot -script fn:configure
