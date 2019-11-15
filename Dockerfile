FROM intersystemsdc/irisdemo-base-irishealthint-community:version-1.6.3
LABEL maintainer="Amir Samary <amir.samary@intersystems.com>"

# Name of the project folder ex.: my-atelier-project
ARG IRIS_PROJECT_FOLDER_NAME=appointmentsms-iris-atelier-project

# To create a directory on the root file system, we need to be temporarily root:
USER root

RUN mkdir /EMRHL7Feed && \
    mkdir /EMRHL7Feed/FileIn && \
    mkdir /EMRHL7Feed/FileOut && \
    chown irisowner:irisuser -R /EMRHL7Feed/ && \
    chmod g+w -R /EMRHL7Feed/

# Going back to irisowner now
USER irisowner

ADD ./html/HL7SchemaDocumentStructure.csp $ISC_PACKAGE_INSTALLDIR/csp/appint/HL7/HL7SchemaDocumentStructure.csp
ADD ./html/LandingPage.png $ISC_PACKAGE_INSTALLDIR/csp/appint
ADD ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/appint/

ADD ./template_hl7_message.txt /EMRHL7Feed

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisuser ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

# Running the installer. This will load the source from our project.
RUN $ISC_PACKAGE_INSTALLDIR/demo/irisdemoinstaller.sh
