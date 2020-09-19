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
$SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# $SUDO apt-get update && $SUDO apt-get install -y apt-transport-https curl
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | $SUDO apt-key add -
# $SUDO cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
# deb https://apt.kubernetes.io/ kubernetes-xenial main
# EOF
# $SUDO apt-get update
# $SUDO apt-get install -y kubelet kubeadm kubectl
# $SUDO apt-mark hold kubelet kubeadm kubectl


$SUDO apt-get update && $SUDO apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | $SUDO apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | $SUDO tee -a /etc/apt/sources.list.d/kubernetes.list
$SUDO apt-get update
$SUDO apt-get install -y kubelet kubeadm kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
$SUDO mv ./kubectl /usr/local/bin/kubectl

$SUDO systemctl daemon-reload
$SUDO systemctl restart kubelet
$SUDO systemctl enable kubelet && $SUDO systemctl start kubelet