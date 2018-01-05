#!/bin/bash

# This is my tiny GIT-commit-script.
# Author: Michael Muyakwa, 2018-01-04
# License: MIT
#

# Check if ".git"-folder exists

directory="$PWD/.git"

if [ ! -d "${directory}" ]
then
    # When ".git"-folder does !NOT! exists
    echo "Initializing local Git-Repo.";

    # Initialize the local Git-Repository
    git init

    # Downloading Standard-Files for local Git-Repository
    wget https://raw.githubusercontent.com/mmuyakwa/Web-WhatsApp/master/.gitignore
    wget https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/LICENSE
    wget https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/.editorconfig
    wget https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/.gitattributes
    echo "Remember to edit README.md!";
    wget https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/README.md

    # Remind me to set the remote Repo
    echo "!---!";
    echo "Set remote repository";
    echo "e.g.:";
    echo "git remote add origin git@github.com:mmuyakwa/bash-scripts.git";
    echo "Check your .gitignore!";
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
        git commit -m "Committed at: $now (automatic via script)"
    else
        #non-zero length
        git commit -m "$1 - Committed at: $now"
    fi

    #git remote add origin git@github.com:mmuyakwa/bash-scripts.git

    # Check if a remote Repo is set.
    if grep -q "url = " ${directory}/config
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

# Setting Verion-Tags: see= https://git-scm.com/book/en/v2/Git-Basics-Tagging
# Set Verion via: git tag -a v1.4 -m "my version 1.4"
# Publish tags: git push origin --tags
