#!/bin/bash

set -e

DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
VERSION=`cat ./VERSION`

docker buildx build --platform linux/arm64 -f ./arm64.dockerfile -t ${DOCKER_REPO}:arm64-version-${VERSION} .
docker tag ${DOCKER_REPO}:arm64-version-${VERSION} ${DOCKER_REPO}:arm64-latest

docker buildx build --platform linux/arm64 -f ./arm64.student.dockerfile -t ${DOCKER_REPO}:arm64-student-version-${VERSION} .
docker tag ${DOCKER_REPO}:arm64-student-version-${VERSION} ${DOCKER_REPO}:arm64-student-latest