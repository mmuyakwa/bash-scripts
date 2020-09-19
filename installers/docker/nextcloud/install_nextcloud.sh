#!/usr/bin/env bash

cd /root/ || exit
mkdir nextcloud

cd "$HOME/scripts/bash-scripts/docker/nextcloud" || exit

docker-compose up -d

echo 'Get the MySQL-passowrds from the "docker-compose.yml".'
