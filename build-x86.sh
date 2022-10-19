#!/bin/bash

set -e

DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
VERSION=`cat ./VERSION`

docker buildx build --platform linux/amd64 -f ./amd64.dockerfile -t ${DOCKER_REPO}:amd64-version-${VERSION} .
docker tag ${DOCKER_REPO}:amd64-version-${VERSION} ${DOCKER_REPO}:amd64-latest

docker buildx build --platform linux/amd64 -f ./amd64.student.docker -t ${DOCKER_REPO}:amd64-student-version-${VERSION} .
docker tag ${DOCKER_REPO}:amd64-student-version-${VERSION} ${DOCKER_REPO}:amd64-student-latest