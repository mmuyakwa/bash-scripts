#!/usr/bin/env bash

#title:         configure-sshd-minimum.sh
#description:   Root- & PASSWORD-Login via ssh allowed. This script is for lazy people who want to keep their Debian-based SSHd safe.
#author:        Michael Muyakwa
#created:       2020-09-15
#updated:       -
#version:       1.0
#license:       MIT
#usage:         sh configure-sshd-minimum.sh
#==============================================================================


#-! IMPORTANT !-#
# This file configures your sshd_config.
# PasswordAuthentication yes # LOGIN WITH PASSWORD WILL BE ALLOWED!!
# PerminRootLogin yes # ROOT can still login via SSH
# PubkeyAuthentication yes
# PermitEmptyPasswords no
# AddressFamily inet #(any, inet, inet6)
# Banner none #Banner /etc/issue.net # none
# MaxAuthTries 3
# Protocol 2 # Force Protocol 2 for security
# UsePAM yes
# Compression no # For security
# IgnoreRhosts yes
# ChallengeResponseAuthentication no
# HostbasedAuthentication no
# X11Forwarding no # For security
# PrintLastLog no # For security
# LoginGraceTime 30s
# ClientAliveCountMax 0
#-! IMPORTANT !-#



# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

SSHConfig=''
[ -f /etc/sshd_config ] && { SSHConfig='/etc/sshd_config'; }
[ -f /etc/ssh/sshd_config ] && { SSHConfig='/etc/ssh/sshd_config'; }

# Set SSHD_CONFIG - Settings
#$SUDO sed -i 's/#\?\(Port\s*\).*$/\1 3303/' $SSHConfig
$SUDO sed -i 's/#\?\(PerminRootLogin\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(PermitEmptyPasswords\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(AddressFamily\s*\).*$/\1 inet/' $SSHConfig #(any, inet, inet6)
$SUDO sed -i 's/#\?\(Banner\s*\).*$/\1 none/' $SSHConfig #Banner /etc/issue.net # none
$SUDO sed -i 's/#\?\(MaxAuthTries\s*\).*$/\1 3/' $SSHConfig
$SUDO sed -i 's/#\?\(UsePAM\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(Compression\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(IgnoreRhosts\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(ChallengeResponseAuthentication\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(HostbasedAuthentication\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(X11Forwarding\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(PrintLastLog\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(LoginGraceTime\s*\).*$/\1 30s/' $SSHConfig
$SUDO sed -i 's/#\?\(ClientAliveCountMax\s*\).*$/\1 0/' $SSHConfig
if grep -q "Protocol" $SSHConfig ; then
    $SUDO sed -i 's/#\?\(Protocol\s*\).*$/\1 2/' $SSHConfig
else
    $SUDO echo "Protocol 2" >> $SSHConfig
fi

# Check if Config has issues
$SUDO sshd -t

if [[ "${?}" -ne 0 ]]; then
   echo "The sshd_config file was not modified successfully"
   exit 1
else
    # Restart SSH-Service
    $SUDO service ssh restart
    $SUDO service ssh status
fi

# Exit script
exit 0
