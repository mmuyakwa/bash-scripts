#!/usr/bin/env bash

#title:         install_mariadb.sh
#description:   This script installs MariaDB.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-06-12
#updated:       N/A
#version:       0.5
#license:       MIT
#usage:         ./install_mariadb.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get install mariadb-server -y

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
