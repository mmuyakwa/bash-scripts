#!/bin/bash

# Check if this is a Linux system with 64-bit architecture
if [ "$(uname)" != "Linux" ] || [ "$(uname -m)" != "x86_64" ]; then
    # If not, exit with an error message
    echo "This script is only for Linux systems with 64-bit architecture."
    exit 1

else

    # If so, install Miniconda

    # Install Miniconda
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh

    # After installing, initialize your newly-installed Miniconda. The following commands initialize for bash and zsh shells:
    ~/miniconda3/bin/conda init bash
    ~/miniconda3/bin/conda init zsh

fi
