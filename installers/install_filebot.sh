#!/bin/sh -xu

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
# http://sourceforge.mirrorservice.org/f/project/fi/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_amd64.deb