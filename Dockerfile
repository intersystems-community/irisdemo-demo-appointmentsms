FROM intersystemsdc/irisdemo-base-irishealthint-community:stable
LABEL maintainer="Amir Samary <amir.samary@intersystems.com>"

# Name of the project folder ex.: my-atelier-project
ARG IRIS_PROJECT_FOLDER_NAME

# Adding source code that will be loaded by the installer
ADD ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

# Running the installer. This will load the source from our project.
RUN /usr/irissys/demo/irisdemoinstaller.sh

RUN mkdir /EMRHL7Feed
RUN mkdir /EMRHL7Feed/FileIn
RUN mkdir /EMRHL7Feed/FileOut

RUN chown root:irisusr -R /EMRHL7Feed/
RUN chmod g+w -R /EMRHL7Feed/

ADD ./html/LandingPage.png $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD ./iris.key /usr/irissys/mgr/
ADD ./test_message.txt /EMRHL7Feed
