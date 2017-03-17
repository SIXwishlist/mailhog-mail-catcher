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

    # Mailhog version
    MAILHOG_VERSION=0.2.1


# A little bit of metadata management.
# See http://label-schema.org/  
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="mail-catcher" \
      org.label-schema.description="This service provides mail catcher daemon to Daspanel."

RUN set -x \

    # Install mailhog
    && wget -O /usr/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v${MAILHOG_VERSION}/MailHog_linux_amd64 \
    && chmod 755 /usr/bin/mailhog \
    && rm -rf /var/cache/apk/* /tmp/*

# Inject files in container file system
COPY rootfs /

# Ativate S6
ENTRYPOINT ["/init"]
CMD []

# Expose ports for the mail catch service
EXPOSE 1025 8025

