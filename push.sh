#!/bin/bash
#
IMAGE_NAME=amirsamary/irisdemo:${PWD##*/}

docker push $IMAGE_NAME