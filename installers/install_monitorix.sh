#!/usr/bin/env bash

# This script installs Monitorix. (http://www.monitorix.org)
# Author: Michael Muyakwa, 2018-01-21
# License: MIT
#

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt-get update
$SUDO apt-get install rrdtool perl libwww-perl libmailtools-perl libmime-lite-perl librrds-perl libdbi-perl libxml-simple-perl libhttp-server-simple-perl libconfig-general-perl libio-socket-ssl-perl
wget http://www.monitorix.org/monitorix_3.10.0-izzy1_all.deb
$SUDO dpkg -i monitorix*.deb
$SUDOapt-get -f install
rm monitorix*.deb

service monitorix restart

echo "Monitorix is now available under: http://localhost:8080/monitorix/"
