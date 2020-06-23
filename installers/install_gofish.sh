#!/usr/bin/env bash

#title:         install_gofish.sh
#description:   This script installs GoFish.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2019-06-02
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_gofish.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi



# Apparently no SUDO needed.


# curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/master/scripts/install.sh | $SUDO bash
curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/master/scripts/install.sh | bash

# Initialize
gofish init

# Once you have GoFish up and running, you can upgrade at any time using
gofish install gofish
gofish upgrade gofish
