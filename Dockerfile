FROM lsiobase/alpine:3.14

RUN apk add --no-cache gettext fuse rclone

RUN rclone version

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY root/ /
