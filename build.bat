@ECHO OFF

SET DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
set /p VERSION=<VERSION
set PWD=%~dp0

docker build -t %DOCKER_REPO%:version-%VERSION% .
docker build -t %DOCKER_REPO%:student-version-%VERSION% -f Dockerfile.student .