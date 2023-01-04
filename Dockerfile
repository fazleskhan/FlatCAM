# Copied from marcus2002/flatcam:1
# https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

FROM fazleskhan/flatcam:marcus2002-flatcam-copy
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

# https://docs.e2enetworks.com/guides/ubuntu_xrdp.html

RUN DEBIAN_FRONTEND=noninteractive apt-get install xrdp -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install install xfce4 xfce4-terminal -y

RUN DEBIAN_FRONTEND=noninteractive sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

RUN DEBIAN_FRONTEND=noninteractive adduser xrdp ssl-cert

RUN DEBIAN_FRONTEND=noninteractive ufw allow 3389/tcp

RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent save

RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent reload

RUN DEBIAN_FRONTEND=noninteractive /etc/init.d/xrdp restart