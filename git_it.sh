#!/usr/bin/env bash

#title:         git_it.sh
#description:   This is my tiny GIT-commit-script.
#author:        Michael Muyakwa
#created:       2018-01-04
#updated:       2018-01-19
#version:       1.2
#license:       MIT
#usage:         ./git_it.sh
#==============================================================================

# Check if ".git"-folder exists

directory="$PWD/.git"

if [ ! -d "${directory}" ]
then
    # When ".git"-folder does !NOT! exists
    echo "Initializing local Git-Repo.";

    # Initialize the local Git-Repository
    git init
    git config --global push.default simple

    # Downloading Standard-Files for local Git-Repository
    wget -nc https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/.gitignore
    wget -nc https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/LICENSE
    wget -nc https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/.editorconfig
    wget -nc https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/.gitattributes
    echo "Remember to edit README.md!";
    wget -nc https://raw.githubusercontent.com/mmuyakwa/bash-scripts/master/README.md

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
        git commit -m "Committed at: $now (automatic via script) [ci skip]"
    else
        #non-zero length
        git commit -m "$1 - Committed at: $now"
    fi

    #git remote add origin git@github.com:mmuyakwa/bash-scripts.git

    # Check if a remote Repo is set.
    if grep -q "url = " "${directory}"/config
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
        echo "For http/s repos you can use 'git config credential.helper store'"
        echo "!---!";
    fi
fi

# Setting Verion-Tags: see= https://git-scm.com/book/en/v2/Git-Basics-Tagging
# Set Verion via: git tag -a v1.4 -m "my version 1.4"
# Publish tags: git push origin --tags
