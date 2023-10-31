#!/bin/bash

# Check to see if Docker is present on the system. If so, delete any Docker images that are no longer in use. 

if [ -x "$(command -v docker)" ]; then
    docker images --filter "dangling=true" -q | xargs docker rmi
fi
