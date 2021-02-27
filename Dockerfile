FROM lsiobase/alpine:3.12 as downloader

ARG VERSION=current

RUN apk --no-cache add ca-certificates curl unzip

#Fetch and unpack
RUN if [ "${VERSION}" != 'current' ]; then FOLDER="/${VERSION}"; fi; curl -O https://downloads.rclone.org/${FOLDER}/rclone-${VERSION}-linux-amd64.zip
RUN unzip rclone-${VERSION}-linux-amd64.zip -d rclone_unzip && \
   cd rclone_unzip/* && \
   mv rclone /rclone

FROM lsiobase/alpine:3.12

COPY --from=downloader /rclone /usr/bin/rclone

RUN apk add --no-cache gettext fuse

RUN rclone version

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY root/ /
