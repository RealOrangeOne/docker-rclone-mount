FROM lsiobase/alpine:3.12

RUN apk --no-cache add rclone

RUN rclone version

RUN apk add --no-cache gettext fuse

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY root/ /
