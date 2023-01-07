# Copied from marcus2002/flatcam:1
# https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

FROM fazleskhan/flatcam:prod
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

ENV LANG=en_US.UTF-8

# https://hub.docker.com/layers/scottyhardy/docker-remote-desktop/latest/images/sha256-22edb81c69a8f0c3b2f410f4faa82b8d678c0f9b7268328ee10e9afe0f4ee359?context=explore


RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
        dbus-x11 \
        firefox \
        git \
        pavucontrol \
        pulseaudio \
        pulseaudio-utils \
        x11-xserver-utils \
        xfce4 \
        xfce4-goodies \
        xfce4-pulseaudio-plugin \
        xorgxrdp \
        xrdp \
        xubuntu-icon-theme \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/bin/entrypoint

EXPOSE 3389/tcp

ENTRYPOINT ["/usr/bin/entrypoint"]

