FROM ubuntu
RUN pwd
RUN apt update
RUN apt install -y sudo
RUN adduser --system flatcam
USER flatcam
WORKDIR /home/flatcam
RUN sudo apt install -y wget unzip
RUN pwd
RUN wget https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.994_sources.zip
RUN pwd
RUN ls
RUN unzip FlatCAM_beta_8.994_sources.zip
RUN ls
WORKDIR /home/flatcam/FlatCAM_beta_8.994_sources
RUN pwd
RUN ls
RUN cat /home/flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN sed -i 's/apt-get/DEBIAN_FRONTEND=noninteractive apt-get/g' /home/flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN cat /home/flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN DEBIAN_FRONTEND=noninteractive sh -x /home/flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh