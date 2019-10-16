#!/bin/bash
source util.sh

IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:latest
STUDENT_IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:latest-student
IRIS_PROJECT_FOLDER_NAME=appointmentsms-iris-atelier-project

printfY "\nBuilding full demo image...\n"
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$IRIS_PROJECT_FOLDER_NAME -t $IMAGE_NAME .
checkError

printfY "\n\nBuilding student demo image...\n"
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$IRIS_PROJECT_FOLDER_NAME -t $STUDENT_IMAGE_NAME -f Dockerfile.student .
checkError