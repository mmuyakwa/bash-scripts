#!/usr/bin/env bash

#title:         install_gofish.sh
#description:   This script installs GoFish.
#               Must be root or SUDO-User to run script successfully.
#author:        Michael Muyakwa
#created:       2019-06-02
#updated:       N/A
#version:       0.1
#license:       MIT
#usage:         ./install_gofish.sh
#==============================================================================

# root is always user_id 0
SUDO=''
if [ $(id -u) -ne 0 ]; then
    SUDO='sudo'
    echo "Your not root."
    echo "Running apt-get with SUDO."
fi

$SUDO apt-get update && $SUDO apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | $SUDO apt-key add -
$SUDO cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
$SUDO apt-get update
$SUDO apt-get install -y kubelet kubeadm kubectl
$SUDO apt-mark hold kubelet kubeadm kubectl

$SUDO systemctl daemon-reload
$SUDO systemctl restart kubelet
