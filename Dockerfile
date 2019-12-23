FROM adoptopenjdk:11-jre-hotspot

ARG SFS_VERSION=2_14_0

RUN curl -L "https://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_$SFS_VERSION.tar.gz" \
    | gunzip \
    | tar x -C /opt/ && \
    rm -Rf /opt/SmartFoxServer_2X/jre

WORKDIR /opt/SmartFoxServer_2X/SFS2X
