# Systemd container
#FROM jrei/systemd-fedora:23
#FROM fedora/systemd-systemd:latest
#FROM fedora:23
FROM jpf91/fedora-systemd:latest


STOPSIGNAL SIGRTMIN+3
USER root
# Exposes TCP/UDP Ports on the container
EXPOSE 53

# Install BIND packages
RUN microdnf -y install bind bind-utils && microdnf clean all

# Enable BIND service
RUN systemctl enable named.service

# Copy in default zone content
COPY --chown=named:named db.* /var/named/dynamic/
RUN chmod 644 /var/named/dynamic/db.*
