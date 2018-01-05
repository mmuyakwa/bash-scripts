#!/bin/bash

# This is my tiny GIT-commit-script.
# Author: Michael Muyakwa, 2018-01-04
# License: MIT
#

# Check if ".git"-folder exists
#[[ -e dir && ! -d dir ]]

directory="$PWD/.git"

if [ ! -d "${directory}" ]
then
    # When ".git"-folder does !NOT! exists
    echo "Initializing local Git-Repo.";
    
    # Initialize the local Git-Repository
    git init

    # Remind me to set the remote Repo
    echo "!---!";
    echo "Set remote repository";
    echo "e.g.:";
    echo "git remote add origin git@github.com:mmuyakwa/bash-scripts.git";
    echo "!---!";
else
    # When ".git"-folder !DOES! exists

    # Show me changes
    echo "Git-Status:";
    git status -s

    # Stange those changes
    echo "Adding changes to Staging-Area.";
    git add -A

    # Generate Date for Commit-Text
    now=$(date +"%Y-%m-%d %H:%M Uhr")

    # Commit changes (If a string was added, use the added string.)
    echo "Committing changes to local Repo.";
    if [ -z "$1" ]; then
        #zero length argument 
        git commit -m "Committed at: $now"
    else
        #non-zero length
        git commit -m "$1 - Committed at: $now"
    fi

    #git remote add origin git@github.com:mmuyakwa/bash-scripts.git

    # Check if a remote Repo is set.
    #git remote -v > /dev/null
    #if [ $? -eq 0 ]; then
    if grep -Fxq "url = " "${directory}/config"
    then
        # Remote Repo ist set. Push changes to remote Repo.
        echo "Pushing to remote Git-Repo.";
        git push -u origin master
    else
        # Remind me to set the remote Repo
        echo "!---!";
        echo "Set remote repository";
        echo "e.g.:";
        echo "git remote add origin git@github.com:mmuyakwa/bash-scripts.git";
        echo "!---!";
    fi
fi

