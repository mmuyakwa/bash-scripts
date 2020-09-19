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

# Apparently no SUDO needed.

# root is always user_id 0
##SUDO=''
##[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }


# curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/master/scripts/install.sh | $SUDO bash
curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/master/scripts/install.sh | bash

# Initialize
gofish init

# Once you have GoFish up and running, you can upgrade at any time using
gofish install gofish
gofish upgrade gofish

