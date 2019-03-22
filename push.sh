#!/bin/bash
#
IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:stable
STUDENT_IMAGE_NAME=intersystemsdc/irisdemo-demo-appointmentsms:student

docker push $IMAGE_NAME
docker push $STUDENT_IMAGE_NAME