FROM scratch AS ctx
COPY build_files /
COPY bin/* /usr/bin/
COPY *.service /usr/etc/systemd/system/

# Base Image
FROM ghcr.io/ublue-os/bazzite-deck:stable

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh
    
## Verify final image and contents are correct.
RUN bootc container lint
