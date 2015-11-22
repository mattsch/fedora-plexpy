# Fedora PlexPy Docker Container

Docker container for [PlexPy](https://github.com/drzoidberg33/plexpy) using Fedora.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -p 8181:8181 --name=plexpy mattsch/fedora-plexpy
```

Create with a custom uid/gid for the plexpy daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 8181:8181 --name=plexpy mattsch/fedora-plexpy
```

Using host networking rather than the port forwards above will give the best
performance.  However, this allows the container to have full access to the
host's networking stack.  Be sure you understand the implications before using
it.

