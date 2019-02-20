#!/usr/bin/env bash

#title:         update.sh
#description:   This script is for lazy people who want to keep their Debian-based system up to date.
#author:        Michael Muyakwa
#created:       2018-01-04
#updated:       2018-01-19
#version:       1.4
#license:       MIT
#usage:         ./update.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update -y

# # Test to show available updates
# $SUDO apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "PROGRAM: $1 INSTALLED: $2 AVAILABLE: $3\n"}'
# # 10 seconds pause
# SEC=10
# for i in `seq $SEC -1 1`;do
#         printf "\rNext step in: %`expr length $SEC`ds" "$i";
#         sleep 1;
# done
# echo

# List available new Packages
$SUDO apt list --upgradeable

$SUDO apt-get upgrade -y
$SUDO apt-get dist-upgrade -y
$SUDO apt-get autoremove -y
$SUDO apt-get autoclean -y

# List packages which where installed today
$SUDO cat /var/log/dpkg.log | grep "^$(date +%Y-%m-%d).*\ installed\ "
