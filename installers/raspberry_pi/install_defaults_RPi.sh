#!/bin/bash

# Default settings for Raspberry Pi's (beginning from RPI3)

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

# ClamAV START
#Stop the Services
$SUDO systemctl stop clamav-daemon
$SUDO systemctl stop clamav-freshclam

# Check if File exists
SWAPF = '/etc/dphys-swapfile'
if [ ! -f $SWAPF ]; then
    #As root, edit the file /etc/dphys-swapfile and modify the variable CONF_SWAPSIZE:
    #CONF_SWAPSIZE=2048
    $SUDO sed -i -r 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=2048/' $SWAPF
fi 

# Check if Folder exists
CLAMAVF = '/var/lib/clamav'
if [ ! -d $CLAMAVF ]; then
    cd $CLAMAVF
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        $SUDO rm -rf *
        $SUDO freshclam
    fi
fi

echo "!IMPORTANT! - Need a reboot for changes to take effect for ClamAV."
$SUDO systemctl start clamav-daemon
$SUDO systemctl start clamav-freshclam
# ClamAV STOP
