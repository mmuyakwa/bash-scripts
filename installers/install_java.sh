#!/usr/bin/env bash

# This script installs Java-JDK (headless) on the system.
# Author: Michael Muyakwa, 2019-10-30
# License: MIT
#

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update -y
$SUDO apt-get install default-jdk-headless
