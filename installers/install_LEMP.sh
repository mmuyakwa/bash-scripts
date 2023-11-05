#!/usr/bin/env bash

#title:         install_LEMP.sh
#description:   This script installs MariaDB.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-06-12
#updated:       N/A
#version:       0.5
#license:       MIT
#usage:         ./install_LEMP.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install mariadb-server -y

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

$SUDO DEBIAN_FRONTEND=noninteractive apt-get install php php-mysql php-fpm -y

$SUDO mysql_secure_installation

echo ''
echo 'REMEMBER!'
echo ''
echo 'Login via "mysql -u root -p"'
echo ''
echo 'Execute the following Command:'
echo ''
echo "GRANT ALL PRIVILEGES on *.* to 'root'@'localhost' IDENTIFIED BY 'YOUR_PASSWORD';"
echo 'FLUSH PRIVILEGES;'

