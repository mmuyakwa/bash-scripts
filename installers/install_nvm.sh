#!/usr/bin/env bash

#title:         install_nvm.sh
#description:   This script installs "NVM" (Node Version Manager). See: https://github.com/creationix/nvm
#author:        Michael Muyakwa
#created:       2018-01-23
#updated:       N/A
#version:       0.6
#license:       MIT
#usage:         ./install_nvm.sh
#==============================================================================

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install --lts

echo "Node.js version: \"$(node -v)\""
echo "NPM version: \"$(npm -v)\""
