#!/bin/bash

# Description: Create a virtual environment with the name of the current directory

# Get the name of the current directory
current_directory=$(basename "$PWD")
echo "You are in the directory: $current_directory"

# Append "-env" to $current_directory
current_directory="$current_directory-env"

# Create a virtual environment with the name $current_directory-env
python -m venv "$current_directory"

# Check if requirements.txt exists and install the imports
if [ -f "requirements.txt" ]; then
    source "$current_directory/bin/activate"

    if [[ "$VIRTUAL_ENV" != "$current_directory" ]]; then
        # Install the imports
        python -m pip install --upgrade pip python-dotenv
        python -m pip install -r requirements.txt
        deactivate
    else
        # Instructions for installing the imports
        echo "Activate the virtual environment and run the following commands:"
        echo "python -m pip install --upgrade pip python-dotenv"
        echo "python -m pip install -r requirements.txt"
    fi

else
    if [[ "$VIRTUAL_ENV" != "$current_directory" ]]; then
        # Install the default imports
        python -m pip install --upgrade pip python-dotenv
        deactivate
    else
        # Instructions for installing the default imports
        echo "Activate the virtual environment and run the following commands:"
        echo "python -m pip install --upgrade pip python-dotenv"
    fi
fi

# Instructions for activating and deactivating the virtual environment
echo ""
echo "To activate this environment, run:"
echo "source $current_directory/bin/activate"
echo ""
echo "Run 'deactivate' to deactivate this environment"
