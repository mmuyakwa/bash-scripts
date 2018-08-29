#!/bin/bash

cd
mkdir scripts
cd scripts
git clone https://github.com/mmuyakwa/bash-scripts.git

cd bash-scripts
sh update.sh

sh installers/install_defaults-Non_GUI.sh
