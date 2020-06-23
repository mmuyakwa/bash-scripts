#!/usr/bin/env bash

locked=$(lsof /var/lib/dpkg/lock | wc -l);

if [ $locked -eq 0 ]; then
  echo "Ist null";
  sleep 5;
  echo $locked;
  exit;
fi