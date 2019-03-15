#!/bin/bash

IMAGE_NAME=amirsamary/irisdemo:${PWD##*/}

IRIS_PROJECT_FOLDER_NAME=irisinteroperability-atelier-project

docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$IRIS_PROJECT_FOLDER_NAME -t $IMAGE_NAME .