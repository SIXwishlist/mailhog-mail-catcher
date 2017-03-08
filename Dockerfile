FROM daspanel/alpine-base
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

# Parse arguments for the build command.
ARG VERSION
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

# Set default env variables
ENV \
    # Stop container initialization if error occurs in cont-init.d, fix-attrs.d script's
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \

    # Timezone
    TZ="UTC" \

    # Confd settings
    CONFD_VERSION=0.11.0 \
    CONFD_PATH=github.com/kelseyhightower/confd
    CONFD_REPO=https://github.com/kelseyhightower/confd.git \
    CONFD_BRANCH=master \
    GOPATH=/usr/local \
    GO17VENDOREXPERIMENT=1

# A little bit of metadata management.
# See http://label-schema.org/  
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vendor="DASPANEL" \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="base-api" \
      org.label-schema.description="This service provides mail catcher daemon to Daspanel." \
      org.label-schema.architecture="x86_64" \
      org.label-schema.distribution="Alpine Linux" \
      org.label-schema.distribution-version="3.4" \

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
        bash gcc musl-dev openssl go git \

    && git clone \
        -b ${CONFD_BRANCH} \
        ${CONFD_REPO} \
        /usr/local/src/${CONFD_PATH} \
  
    && cd /usr/local/src/${CONFD_PATH} \
    && go build -o /usr/bin/confd \

    && apk del .build-deps \
    
    && rm -rf \
        /var/cache/apk/* \
        /usr/local/*

# Inject files in container file system
COPY rootfs /


