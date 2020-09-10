#!/usr/bin/env bash

#title:         install_webmin.sh
#description:   This script installs Webmin ( http://www.webmin.com/deb.html ).
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-06-11
#updated:       N/A
#version:       0.5
#license:       MIT
#usage:         ./install_webmin.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }


wget http://prdownloads.sourceforge.net/webadmin/webmin_1.881_all.deb

$SUDO apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python -y

$SUDO dpkg --install webmin_1.881_all.deb

rm -f webmin_1.881_all.deb

