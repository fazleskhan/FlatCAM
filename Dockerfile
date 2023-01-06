# Copied from marcus2002/flatcam:1
# https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

FROM fazleskhan/flatcam:prod
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

# https://docs.e2enetworks.com/guides/ubuntu_xrdp.html
#RUN DEBIAN_FRONTEND=noninteractive apt-get install xrdp -y

#RUN DEBIAN_FRONTEND=noninteractive apt-get install xfce4 xfce4-terminal -y

#RUN DEBIAN_FRONTEND=noninteractive sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

# ufw does not work with DockerDesktop/WSL2 because it does not use netfilter instead use the -p runtime option to setup port mapping

#RUN DEBIAN_FRONTEND=noninteractive ufw enable

#RUN DEBIAN_FRONTEND=noninteractive ufw allow 3389/tcp

#RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent save

#RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent reload

# https://stackoverflow.com/questions/27701930/how-to-add-users-to-docker-container
#RUN DEBIAN_FRONTEND=noninteractive useradd -rm -d /home/uflatcam -s /bin/bash -g root -G sudo,ssl-cert -u 1001 -p "$(openssl passwd -1 uflatcam)" uflatcam

#RUN DEBIAN_FRONTEND=noninteractive /etc/init.d/xrdp restart

#USER uflatcam
#WORKDIR /home/uflatcam

# https://hub.docker.com/layers/scottyhardy/docker-remote-desktop/latest/images/sha256-22edb81c69a8f0c3b2f410f4faa82b8d678c0f9b7268328ee10e9afe0f4ee359?context=explore

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                                           dbus-x11 \
                                           firefox \
                                           git \
                                           locales \ 
                                           pavucontrol \
                                           pulseaudio \
                                           pulseaudio-utils \
                                           sudo \
                                           x11-xserver-utils \
                                           xfce4 \
                                           xfce4-goodies \
                                           xfce4-pulseaudio-plugin \
                                           xorgxrdp \
                                           xrdp \
                                           xubuntu-icon-theme \
                                           && rm -rf /var/lib/apt/lists/* # buildkit

RUN DEBIAN_FRONTEND=noninteractive sed -i -E 's/^; autospawn =.*/autospawn = yes/' /etc/pulse/client.conf     && [ -f /etc/pulse/client.conf.d/00-disable-autospawn.conf ] && sed -i -E 's/^(autospawn=.*)/# \1/' /etc/pulse/client.conf.d/00-disable-autospawn.conf || :     && locale-gen en_US.UTF-8 # buildkit

ENV LANG=en_US.UTF-8

COPY /usr/lib/pulse-*/modules/module-xrdp-sink.so /usr/lib/pulse-*/modules/module-xrdp-source.so /var/lib/xrdp-pulseaudio-installer/ # buildkit

# COPY entrypoint.sh /usr/bin/entrypoint # buildkit

EXPOSE 3389/tcp

# ENTRYPOINT ["/usr/bin/entrypoint"]