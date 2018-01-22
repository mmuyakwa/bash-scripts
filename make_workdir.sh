#!/bin/bash

#title:         make_workdir.sh
#description:   This Script creates my daily folder for starting new projects.
#author:        Michael Muyakwa
#created:       2018-01-04
#updated:       N/A
#version:       1.0
#license:       MIT
#usage:         ./make_workdir.sh
#==============================================================================

# Current Date
now=$(date +"%Y-%m-%d %H:%M Uhr")

# Path i wish to create (German Ubuntu-System, therefor "Dokumente")
# e.g.: "/home/mmuyakwa/Dokumente/Workbench/2018/01/2018-01-04"
WorkDirPath=~/Dokumente/Workbench/$(date +"%Y")/$(date +"%m")/$(date +"%Y-%m-%d")

if [ ! -d "${WorkDirPath}" ]
then

    # Show Variables and path that will be generated
    echo $now
    echo $WorkDirPath

    # mkdir "-p" (-p = "no error if existing, make parent directories as needed")
    mkdir -p $WorkDirPath

    # Checking which Filemanager is installed (Nautilus/Pantheon-Files)
    which nautilus > /dev/null
    if [ $? -eq 0 ]; then
        nautilus $WorkDirPath &
    fi

    which pantheon-files > /dev/null
    if [ $? -eq 0 ]; then
        pantheon-files $WorkDirPath &
    fi

fi

echo $WorkDirPath
cd $WorkDirPath
exec bash

