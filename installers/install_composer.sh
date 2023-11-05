#!/usr/bin/env bash

#title:         install_composer.sh
#description:   This script installs composer ( https://getcomposer.org/download/ ).
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2018-01-05
#updated:       N/A
#version:       0.8
#license:       MIT
#usage:         ./install_composer.sh
#==============================================================================

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install PHP-CLI in v7.0 (php 7.0)
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install php-cli -y
# Dependencies for Lavarel
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install php-zip php-gd php-mbstring php-xml php-mysql php-pear php-token-stream php-json curl php-curl openssl -y

# Script from https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php

# Set composer global
$SUDO mv composer.phar /usr/local/bin/composer

# Install Lavarel globaly (A PHP MVC-Framework)
composer global require "laravel/installer"
# Write LAVAREL to $PATH
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc

# install Node.js
curl -sL https://deb.nodesource.com/setup_8.x | $SUDO -E bash -
$SUDO DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

exit $RESULT
