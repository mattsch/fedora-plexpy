#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u tautulli )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} tautulli
fi

if [ "$( id -g tautulli )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} tautulli
fi

# Move the old config if it exists
if [ ! -f "/config/plexpy.ini" ]; then
    mv /config/plexpy.ini /config/tautulli.ini
fi

# Set permissions
chown -R tautulli:tautulli /config/ /opt/tautulli

exec runuser -l tautulli -c '/opt/tautulli/PlexPy.py --nolaunch --quiet --config /config/tautulli.ini --datadir /config/data'
