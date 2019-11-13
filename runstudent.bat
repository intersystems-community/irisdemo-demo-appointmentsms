@ECHO OFF

SET DOCKER_REPO=intersystemsdc/irisdemo-demo-appointmentsms
set /p VERSION=<VERSION
set PWD=%~dp0

echo Running container.
echo   Management portal is on http://localhost:52773/csp/sys/UtilHome.csp
echo   Simulator page is on http://localhost:52773/csp/appint/demo.csp
echo   InterSystems IRIS Web Server Port is on 52773.
echo   InterSystems IRIS Super Server Port is on 51773.
echo

docker run --init -it --rm -p 51773:51773 -p 52773:52773 --name appointmentsms-student %DOCKER_REPO%:student-version-%VERSION%

echo
echo Exited container
echo