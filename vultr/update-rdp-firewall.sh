#!/usr/bin/env bash

ext_ip=$(wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
echo "My IP: $ext_ip"

vultr-cli firewall rule delete cc1360ad 1
vultr-cli firewall rule create -c "$ext_ip"/32 -i cc1360ad -o 3389 -p tcp
vultr-cli firewall rule list cc1360ad
