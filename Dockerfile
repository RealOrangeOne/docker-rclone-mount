FROM lsiobase/alpine:3.11

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community rclone

RUN rclone version

RUN apk add --no-cache gettext fuse

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY root/ /
