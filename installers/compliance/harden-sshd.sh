#!/usr/bin/env bash

#SSH-Hardening
#title:         harden-sshd.sh
#description:   Harden SSHD_CONFIG
#author:        Michael Muyakwa
#created:       2020-09-09
#updated:       N/A
#version:       0.5
#license:       MIT
#usage:         ./harden-sshd.sh

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Configuring unattended updates
$SUDO apt-get install unattended-upgrades
$SUDO dpkg-reconfigure -f noninteractive --priority=low unattended-upgrades

# Checking where the sshd_config is
SSHConfig=''
[ -f /etc/sshd_config ] && { SSHConfig='/etc/sshd_config'; }
[ -f /etc/ssh/sshd_config ] && { SSHConfig='/etc/ssh/sshd_config'; }
echo "The config-file for sshd is: $SSHConfig"


# Install "sshd_config"-tool (needs Ruby) - https://github.com/igorbonadio/sshd_config
$SUDO apt install ruby ruby-dev gcc g++ make -y
$SUDO gem install sshd_config

# Configure "sshd_config"-file
$SUDO sshd_config $SSHConfig set:Port 3303
$SUDO sshd_config $SSHConfig set:AddressFamily inet #(any, inet, inet6)
$SUDO sshd_config $SSHConfig set:PermitRootLogin no
$SUDO sshd_config $SSHConfig set:PasswordAuthentication no
$SUDO sshd_config $SSHConfig set:Banner none #Banner /etc/issue.net # none
$SUDO sshd_config $SSHConfig set:MaxAuthTries 3 # WAS PASSIERT DA???
$SUDO sshd_config $SSHConfig set:Protocol 2
$SUDO sshd_config $SSHConfig set:UsePAM yes
$SUDO sshd_config $SSHConfig set:Compression delayed
$SUDO sshd_config $SSHConfig set:IgnoreRhosts yes
$SUDO sshd_config $SSHConfig set:ChallengeResponseAuthentication no
$SUDO sshd_config $SSHConfig set:PermitEmptyPasswords no
$SUDO sshd_config $SSHConfig set:HostbasedAuthentication no
$SUDO sshd_config $SSHConfig set:X11Forwarding no
$SUDO sshd_config $SSHConfig set:PrintLastLog no
$SUDO sshd_config $SSHConfig set:LoginGraceTime 30s

$SUDO service ssh restart


#AllowGroups sshusers

# Install "inspec" to check the SSH-Settings against SSH-Baseline-Security - https://dev-sec.io/baselines/ssh/
curl https://omnitruck.chef.io/install.sh | $SUDO bash -s -- -P inspec

$SUDO inspec exec https://github.com/dev-sec/ssh-baseline


# Read "sshd_config"-file
$SUDO sshd_config $SSHConfig get:Port
$SUDO sshd_config $SSHConfig get:AddressFamily
$SUDO sshd_config $SSHConfig get:PermitRootLogin
$SUDO sshd_config $SSHConfig get:PasswordAuthentication
$SUDO sshd_config $SSHConfig get:Banner
$SUDO sshd_config $SSHConfig get:MaxAuthTries
$SUDO sshd_config $SSHConfig get:Protocol
$SUDO sshd_config $SSHConfig get:UsePAM
$SUDO sshd_config $SSHConfig get:Compression
$SUDO sshd_config $SSHConfig get:IgnoreRhosts
$SUDO sshd_config $SSHConfig get:ChallengeResponseAuthentication
$SUDO sshd_config $SSHConfig get:PermitEmptyPasswords
$SUDO sshd_config $SSHConfig get:HostbasedAuthentication
$SUDO sshd_config $SSHConfig get:X11Forwarding
$SUDO sshd_config $SSHConfig get:PrintLastLog
$SUDO sshd_config $SSHConfig get:LoginGraceTime
