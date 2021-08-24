#!/usr/bin/with-contenv bash
# shellcheck disable=2154

rm -rf "$mount_point"
mkdir -p "$mount_point"
chown -R abc:abc "$mount_point"

exec s6-setuidgid abc rclone --config /tmp/rclone.conf mount --allow-other "$remote_name" "$mount_point" "${params[@]}"
