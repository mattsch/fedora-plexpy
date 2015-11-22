#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u plexpy )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} plexpy
fi

if [ "$( id -g plexpy )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} plexpy
fi

# Copy a default file over
if [ ! -f "/config/plexpy.ini" ]; then
    cp /opt/plexpy/config.ini /config/plexpy.ini
fi

# Set permissions
chown -R plexpy:plexpy /config/ /opt/plexpy

exec runuser -l plexpy -c '/opt/plexpy/PlexPy.py --daemon --nolaunch --quiet --config /config/plexpy.ini --datadir /config/data'
