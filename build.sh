#!/bin/bash

IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:stable

IRIS_PROJECT_FOLDER_NAME=appointmentsms-iris-atelier-project

docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$IRIS_PROJECT_FOLDER_NAME -t $IMAGE_NAME .