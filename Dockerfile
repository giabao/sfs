FROM adoptopenjdk:11-jre-hotspot

ARG SFS_VERSION=2_14_0

RUN set -eux; \
    curl -L "https://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_$SFS_VERSION.tar.gz" \
    | gunzip \
    | tar x -C /opt/; \
    cd /opt/SmartFoxServer_2X/; \
    rm -Rf jre; \
    ln -s /opt/java/openjdk/ jre; \
    { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
        echo 'exec "$@"'; \
	} | tee SFS2X/entrypoint; \
    chmod a+x SFS2X/entrypoint;
    

WORKDIR /opt/SmartFoxServer_2X/SFS2X
ENTRYPOINT ["./entrypoint"]
EXPOSE 9933 8080 8443
CMD ["./sfs2x-service", "start-launchd"]
