#!/bin/bash

set -e


DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
VERSION=`cat ./VERSION`

docker push ${DOCKER_REPO}:amd64-version-${VERSION}
docker push ${DOCKER_REPO}:amd64-latest
