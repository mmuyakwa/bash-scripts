#!/usr/bin/env bash

#title:         install_libreoffice-de.sh
#description:   This script installs LibreOffice in German on a Desktop.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-12-14
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_libreoffice-de.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt-get update

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install libreoffice-calc libreoffice-writer libreoffice-help-de libreoffice-l10n-de -y
