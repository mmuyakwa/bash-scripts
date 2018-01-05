# bash-scripts

A tiny collection of **Shell-Scripts** I use on a regular basis.

## Table of Contents

<!-- toc -->

* [git_it.sh](#git-script)
* [make_workdir.sh](#Workbench-Script)

<!-- toc stop -->

## Git-Script

The innitial run of this script checks if a Git-Repo already exists.

If not, it runs

    git init

The Repo will be created and it'll **remind** you to set the remote Repo.

    echo "!---!";
    echo "Set remote repository";
    echo "e.g.:";
    echo "git remote add origin git@github.com:mmuyakwa/bash-scripts.git";
    echo "!---!";

At this stage the scripts **exits** the `initial run`.

If you run the script another time it will check for changes and stages these and commits them.

    git status -s
    git add -A
    git commit -m "Committed at: $now (automatic via script)"

If you run this script with an string, that string will be used for the commit-message.

    git_it.sh "Your Message"

which will then

    git commit -m "Your Message - Committed at: $now"

The last step is to check if a remote Repo ist set and pushes the repo to remote.

    git push -u origin master

## Workbench-Script

Before starting a new project, I usually generate a Folder with the current date, where I put my project folders into.

    e.g.: ~/Dokumente/Workbench/2018/01/2018-01-04/

There I generate my project folders for the day.

Only if a project pens our, will I move it to my **main** `projects folder`.

I generate the foldername with the current date via:

    WorkDirPath=~/Dokumente/Workbench/$(date +"%Y")/$(date +"%m")/$(date +"%Y-%m-%d")

And create the folder via **mkdir** with the parameter `-p` which will show no errors if a folder already exists, while creating that path.

MIT License