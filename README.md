# Docker rclone mount

![](https://github.com/RealOrangeOne/docker-rclone-mount/workflows/CI/badge.svg)

Docker container to manage mounting remote storage using [rclone](https://rclone.org/) via FUSE.

Inspired by https://github.com/tynor88/docker-rclone-mount.

The container is set to auto-update, so should always be up-to-date!

Based off the [linuxserver.io](https://www.linuxserver.io/) Alpine container, each mounting process is separate, and automatically restarted should it error.

## Configuration

Multiple mounts can be setup using a config file. The file contains an rclone remote, and a destination mount inside the container relative to `/mnt`, separated by a space.

An example compose file for this can be found in [`docker-compose.yml`](./docker-compose.yml).

To change the user which the files are mounted as, set `$PUID` and `$PGID`.
