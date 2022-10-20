#!/bin/bash

DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
VERSION=`cat ./VERSION`
CONTAINER_NAME=${PWD##*/}

printf "\n\nRunning container. "
printf "\n\t Management portal is on http://localhost:52773/csp/sys/UtilHome.csp"
printf "\n\t Simulator page is on http://localhost:52773/csp/appint/demo.csp"
printf "\n\t InterSystems IRIS Web Server Port is on 52773."
printf "\n\t InterSystems IRIS Super Server Port is on 51773.\n\n"

docker run -it --rm \
    -p 51773:51773 -p 52773:52773 \
    -e TINI_SUBREAPER=true \
    --name appointmentsms \
    ${DOCKER_REPO}:amd64-version-${VERSION} --check-caps false

printf "\nExited container\n"