#!/bin/bash

now=$(date +"%Y-%m-%d")
WorkDirPath=~/Dokumente/Workbench/$(date +"%Y")/$(date +"%m")/$(date +"%Y-%m-%d")

echo $now
echo $WorkDirPath

mkdir -p $WorkDirPath && cd $WorkDirPath && nautilus $WorkDirPath & 
