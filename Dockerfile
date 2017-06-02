FROM lsiobase/xenial.armhf
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# package verions
ARG SYNC_VER="stable"

# install resilio
RUN \
 curl -o \
 /tmp/sync.tar.gz -L \
	"https://download-cdn.getsync.com/${SYNC_VER}/linux-armhf/resilio-sync_armhf.tar.gz" && \
 tar xf \
 /tmp/sync.tar.gz \
	-C /usr/bin && \

# cleanup
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8888 55555
VOLUME /config /sync
