FROM intersystemsdc/irisdemo-base-irishealthint-community:2019.1.0-released-community
LABEL maintainer="Amir Samary <amir.samary@intersystems.com>"

# Name of the project folder ex.: my-atelier-project
ARG IRIS_PROJECT_FOLDER_NAME

# Adding source code that will be loaded by the installer
ADD ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

RUN mkdir /EMRHL7Feed && \
    mkdir /EMRHL7Feed/FileIn && \
    mkdir /EMRHL7Feed/FileOut && \
    chown root:irisusr -R /EMRHL7Feed/ && \
    chmod g+w -R /EMRHL7Feed/

ADD ./html/HL7SchemaDocumentStructure.csp $ISC_PACKAGE_INSTALLDIR/csp/user/HL7/HL7SchemaDocumentStructure.csp
ADD ./html/LandingPage.png $ISC_PACKAGE_INSTALLDIR/csp/user
ADD ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/user/

ADD ./template_hl7_message.txt /EMRHL7Feed

# Running the installer. This will load the source from our project.
RUN /usr/irissys/demo/irisdemoinstaller.sh
