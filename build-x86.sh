#!/bin/bash

set -e

DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
VERSION=`cat ./VERSION`

docker build -t ${DOCKER_REPO}:version-${VERSION} .
docker build -t ${DOCKER_REPO}:student-version-${VERSION} -f Dockerfile.student .