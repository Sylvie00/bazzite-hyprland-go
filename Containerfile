ARG SOURCE_IMAGE="bazzite"
ARG SOURCE_SUFFIX="-deck"
ARG SOURCE_TAG="stable"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY build.sh /tmp/build.sh

RUN set -ex; \
    mkdir -p /var/lib/alternatives; \
    /tmp/build.sh; \
    ostree container commit
