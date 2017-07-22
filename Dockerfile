FROM mattsch/fedora-rpmfusion:26
MAINTAINER Matthew Schick <matthew.schick@gmail.com>

# Run updates
RUN dnf upgrade -yq && \
    dnf clean all

# Install required packages
RUN dnf install -yq git \
                    python \
                    which && \
    dnf clean all

# Set uid/gid (override with the '-e' flag), 1000/1000 used since it's the
# default first uid/gid on a fresh Fedora install
ENV LUID=1000 LGID=1000

# Create the plexpy user/group
RUN groupadd -g $LGID plexpy && \
    useradd -c 'PlexPy User' -s /bin/bash -m -d /opt/plexpy -g $LGID -u $LUID plexpy
    
# Grab the installer, do the thing
RUN git clone -q https://github.com/JonnyWong16/plexpy.git /opt/plexpy/app && \
    chown -R plexpy:plexpy /opt/plexpy

# Need a config and storage volume, expose proper port
VOLUME /config
EXPOSE 8181

# Add script to copy default config if one isn't there and start plexpy
COPY run-plexpy.sh /bin/run-plexpy.sh
 
# Run our script
CMD ["/bin/run-plexpy.sh"]


