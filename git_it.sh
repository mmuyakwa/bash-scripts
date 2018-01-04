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

# Commit changes
git commit -m "Edited comments - Committed at: ($now)"

#git remote add origin git@github.com:mmuyakwa/bash-scripts.git

# Push changes 
git push -u origin master
