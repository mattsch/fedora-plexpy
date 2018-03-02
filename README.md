# Fedora Tautulli Docker Container

Docker container for [Tautulli](http://tautulli.com/) using Fedora.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -p 8181:8181 --name=tautulli mattsch/fedora-tautulli
```

Create with a custom uid/gid for the tautulli daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 8181:8181 --name=tautulli mattsch/fedora-tautulli
```

## Tags

Tags should follow upstream releases (including prereleases) and latest should
be the latest built.
