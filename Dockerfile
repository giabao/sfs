FROM ohze/sfs:2.13.0

ARG SFS_PATCH=2.13.7

RUN set -eux; \
    apt-get update && apt-get install -y unzip; \
    cd /opt/SmartFoxServer_2X; \
    curl -LO "http://repo.bennuoc.com/repository/raw/SFS2X-Patch-$SFS_PATCH.zip"; \
    unzip -q SFS2X-Patch-$SFS_PATCH.zip; \
    apt-get remove --purge -y unzip; \
    rm -rf /var/lib/apt/lists/*; \
    cd SFS2X-Patch-$SFS_PATCH; \
    ./install-linux.sh; \
    cd ..; \
    rm -rf SFS2X-Patch-$SFS_PATCH SFS2X-Patch-$SFS_PATCH.zip;
