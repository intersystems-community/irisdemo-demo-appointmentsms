#!/bin/bash
#
# This script is just to test the container. You should NOT start it with
# Durable %SYS!
#
# Amir Samary - 2018

# Constants:
CONTAINER_NAME=${PWD##*/}
# The name of the image is based on the name of the folder
IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:student

printf "\n\nRunning container. Management portal is on http://localhost:52773/csp/sys/UtilHome.csp\n\n"

docker run -it --rm \
    -p 51773:51773 -p 52773:52773 \
    --name $CONTAINER_NAME \
    $IMAGE_NAME

printf "\nExited container\n"
