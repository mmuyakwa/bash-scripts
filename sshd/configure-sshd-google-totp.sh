#!/usr/bin/env bash

#title:         configure-sshd-google-totp.sh
#description:   This script enables Google-Authenticator for Debian-based SSHd-access.
#author:        Michael Muyakwa
#created:       2020-09-15
#updated:       -
#version:       1.0
#license:       MIT
#usage:         sh configure-sshd-google-totp.sh
#==============================================================================


#-! IMPORTANT !-#
# ChallengeResponseAuthentication yes
# PasswordAuthentication no
# PubkeyAuthentication yes
# AuthenticationMethods publickey,keyboard-interactive
#-! IMPORTANT !-#

# root is always user_id 0
SUDO=''
[ $(id -u) -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

# Install the Google-Authenticator
$SUDO apt install libpam-google-authenticator -y

SSHConfig=''
[ -f /etc/sshd_config ] && { SSHConfig='/etc/sshd_config'; }
[ -f /etc/ssh/sshd_config ] && { SSHConfig='/etc/ssh/sshd_config'; }

# Append to "/etc/pam.d/sshd" # To allow login only with totp, remove "nullok".
$SUDO echo "auth required pam_google_authenticator.so nullok" >> /etc/pam.d/sshd

# Comment out "@include common-auth" in the heading.
sed -i -e 's/@include common-auth/#@include common-auth/g' /etc/pam.d/sshd

# Find out where the SSHD_CONFIG is.
SSHConfig=''
[ -f /etc/sshd_config ] && { SSHConfig='/etc/sshd_config'; }
[ -f /etc/ssh/sshd_config ] && { SSHConfig='/etc/ssh/sshd_config'; }

# Set needed SSHD_CONFIG - Settings
$SUDO sed -i 's/#\?\(ChallengeResponseAuthentication\s*\).*$/\1 yes/' $SSHConfig
$SUDO sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 no/' $SSHConfig
$SUDO sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' $SSHConfig
if [ grep -Fxq "AuthenticationMethods" $SSHConfig ]; then
    $SUDO sed -i 's/#\?\(AuthenticationMethods\s*\).*$/\1 publickey,keyboard-interactive/' $SSHConfig
else
    $SUDO echo "AuthenticationMethods publickey,keyboard-interactive" >> $SSHConfig
fi


# Check if Config has issues
$SUDO sshd -t

if [[ "${?}" -ne 0 ]]; then
   echo "The sshd_config file was NOT modified successfully"
   exit 1
else
    # Restart SSH-Service
    $SUDO service ssh restart
    $SUDO service ssh status

    if [ ! -f ~/.google_authenticator ]; then
        echo ""
        echo "You will have to run this command:"
        echo "google-authenticator -t -f -d -w 3 -e 10 -r 3 -R 30"
    fi
fi

# Exit script
exit 0
