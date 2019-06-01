#!/usr/bin/env bash

#title:         install_inspec.sh
#description:   This script installs Inspec.
#author:        Michael Muyakwa
#created:       2019-04-14
#updated:       2019-04-14
#version:       0.5
#license:       MIT
#usage:         ./install_inspec.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi


$SUDO apt-get -y install ruby ruby-dev ruby-bundler gcc g++ make auditd
gem install rake inspec

