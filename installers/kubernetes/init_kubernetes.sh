#!/usr/bin/env bash

# root is always user_id 0
$SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO kubeadm init

####################
echo "!!!IMPORTANT!!!"
echo "Write the last line down!"
echo "!!!IMPORTANT!!!"
####################

mkdir -p $HOME/.kube
$SUDO cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$SUDO chown $(id -u):$(id -g) $HOME/.kube/config

# Activate networking
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
#kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml

echo "### To install Dashboard:"
echo "kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml"
echo "kubectl proxy"
echo "### Afterwards open: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
echo ""
