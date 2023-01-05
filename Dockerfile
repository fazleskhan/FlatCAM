# Copied from marcus2002/flatcam:1
# https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

FROM fazleskhan/flatcam:prod
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

# https://stackoverflow.com/questions/27701930/how-to-add-users-to-docker-container
RUN DEBIAN_FRONTEND=noninteractive useradd -rm -d /home/uflatcam -s /bin/bash -g root -G sudo,ssl-cert -u 1001 uflatcam

# https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/
RUN DEBIAN_FRONTEND=noninteractive usermod -aG sudo uflatcam

# https://docs.e2enetworks.com/guides/ubuntu_xrdp.html
RUN DEBIAN_FRONTEND=noninteractive apt-get install xrdp -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install xfce4 xfce4-terminal -y

RUN DEBIAN_FRONTEND=noninteractive sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

#RUN DEBIAN_FRONTEND=noninteractive adduser uflatcam ssl-cert

# ufw does not work with DockerDesktop/WSL2 because it does not use netfilter instead use the -p runtime option to setup port mapping

#RUN DEBIAN_FRONTEND=noninteractive ufw enable

#RUN DEBIAN_FRONTEND=noninteractive ufw allow 3389/tcp

#RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent save

#RUN DEBIAN_FRONTEND=noninteractive netfilter-persistent reload

RUN DEBIAN_FRONTEND=noninteractive /etc/init.d/xrdp restart

USER uflatcam
WORKDIR /home/uflatcam