#!/usr/bin/env bash

cd /root/
mkdir nextcloud

cd ~/scripts/bash-scripts/docker/nextcloud

docker-compose up -d

echo 'Get the MySQL-passowrds from the "docker-compose.yml".'
