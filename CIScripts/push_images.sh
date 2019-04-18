#!/bin/bash

SEMVER_NEW_TAG=$1

echo $SEMVER_NEW_TAG

TAGGED_IMAGE=${IMAGE_NAME}:$SEMVER_NEW_TAG
TAGGED_STUDENT_IMAGE=${IMAGE_NAME}:student-$SEMVER_NEW_TAG
STABLE_IMAGE=${IMAGE_NAME}:stable
STABLE_STUDENT_IMAGE=${IMAGE_NAME}:student

printfY "\nBuilding full demo images...\n"
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=${IRIS_PROJECT_FOLDER_NAME} -t $TAGGED_IMAGE .
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=${IRIS_PROJECT_FOLDER_NAME} -t $STABLE_IMAGE .

printfY "\n\nBuilding student demo image...\n"
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=${IRIS_PROJECT_FOLDER_NAME} -t $TAGGED_STUDENT_IMAGE -f Dockerfile.student .
docker build --build-arg IRIS_PROJECT_FOLDER_NAME=${IRIS_PROJECT_FOLDER_NAME} -t $STABLE_STUDENT_IMAGE -f Dockerfile.student .

docker push $TAGGED_IMAGE
docker push $STABLE_IMAGE
docker push $TAGGED_STUDENT_IMAGE
docker push $STABLE_STUDENT_IMAGE

exit 0
