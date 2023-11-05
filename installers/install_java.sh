#!/usr/bin/env bash

# This script installs Java-JDK (headless) on the system.
# Author: Michael Muyakwa, 2019-10-30
# License: MIT
#

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt-get update -y
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install default-jdk-headless
