#!/bin/bash

# This is my tiny GIT-commit-script.
# Author: Michael Muyakwa, 2018-01-04
# License: MIT
#

# Show me changes
git status

# Stange those changes
git add -A

# Generate Date for Commit-Text
now=$(date +"%Y-%m-%d %H:%M Uhr")

# Commit changes (If a string was added, use the added string.)
if [ -z "$1" ]; then
    #zero length argument 
    git commit -m "Committed at: $now"
else
    #non-zero length
    git commit -m "$1 - Committed at: $now"
fi

#git remote add origin git@github.com:mmuyakwa/bash-scripts.git

# Push changes 
git push -u origin master
