#Install HTTPS transport for APT if you haven't already:
apt install apt-transport-https

#Import the GPG signing key (signed by the Jellyfin Team):
wget -O - https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | apt-key add -

#Add a repository configuration at /etc/apt/sources.list.d/jellyfin.list:
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/debian $( lsb_release -c -s ) main" | tee /etc/apt/sources.list.d/jellyfin.list

#NOTE: Supported releases are: stretch and buster.

#Update APT repositories:
apt update

#Install Jellyfin:
apt install jellyfin -y

#Manage the Jellyfin system service with your tool of choice:
service jellyfin status
systemctl restart jellyfin

echo http://$(echo $HOSTNAME):8096

