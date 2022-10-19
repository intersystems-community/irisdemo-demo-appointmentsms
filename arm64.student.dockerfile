FROM intersystemsdc/irisdemo-base-irishealthint-community:arm64-version-1.11.6
LABEL maintainer="Amir Samary <amir.samary@intersystems.com>"

# Name of the project folder ex.: my-atelier-project
ARG IRIS_PROJECT_FOLDER_NAME=appointmentsms-iris-atelier-project

# To create a directory on the root file system, we need to be temporarily root:
USER root

RUN mkdir /EMRHL7Feed && \
    mkdir /EMRHL7Feed/FileIn && \
    mkdir /EMRHL7Feed/FileOut && \
    chown irisowner:irisowner -R /EMRHL7Feed/ && \
    chmod g+w -R /EMRHL7Feed/

# Going back to irisowner now
USER irisowner

ADD --chown=irisowner:irisowner ./html/HL7SchemaDocumentStructure.csp $ISC_PACKAGE_INSTALLDIR/csp/appint/HL7/HL7SchemaDocumentStructure.csp
ADD --chown=irisowner:irisowner ./html/LandingPage.png $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD --chown=irisowner:irisowner ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD --chown=irisowner:irisowner ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/appint/
ADD --chown=irisowner:irisowner ./template_hl7_message.txt /EMRHL7Feed

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisowner ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

# Loading the script that will undo some of the code so that students can do it themselves
RUN rm $IRIS_APP_SOURCEDIR/IRISDemo/EMRHL7FeedRoutingRule.cls
ADD --chown=irisowner:irisowner ./student/EmptyProduction.cls $IRIS_APP_SOURCEDIR/IRISDemo/Production.cls
ADD --chown=irisowner:irisowner ./student/AppointmentOperation.cls $IRIS_APP_SOURCEDIR/IRISDemo/BO/Appointment/Operation.cls

SHELL ["/bin/bash", "-c"]
# Running the installer. This will load the source from our project.
RUN /demo/irisdemoinstaller.sh
