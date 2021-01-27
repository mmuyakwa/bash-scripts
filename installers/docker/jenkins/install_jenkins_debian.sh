#!/usr/bin/env bash

# this script has been tested on debian buster

# install Jenkins

# root is always user_id 0
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }

$SUDO apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates curl

$SUDO apt-get update

# run jenkins
$SUDO mkdir -p /var/jenkins_home
$SUDO chown -R 1000:1000 /var/jenkins_home/

wget https://github.com/wardviaene/jenkins-docker/raw/master/Dockerfile
#docker build -t jenkins-docker .
#docker run -p 8780:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins -d jenkins-docker

docker-compose up -d --build

# show endpoint
echo 'Jenkinsn is installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8780'

