#!/bin/bash

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update -y
$SUDO apt-get install git -y

cd
mkdir scripts
cd scripts
git clone https://github.com/mmuyakwa/bash-scripts.git

cd bash-scripts
sh update.sh

sh installers/install_defaults-Non_GUI.sh
