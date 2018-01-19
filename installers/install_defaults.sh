#!/bin/bash

# This script installs composer ( https://getcomposer.org/download/ ).
# Must be root or SUDO-User to run script successfully.
# Author: Michael Muyakwa, 2018-01-05
# License: MIT

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# Install my usual suspects
$SUDO apt-get install filezilla remmina mc screen build-essentials curl git -y

# filezilla remmina mc screen build-essentials curl git
