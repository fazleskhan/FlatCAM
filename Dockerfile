FROM ubuntu
RUN pwd
RUN apt update
RUN apt install -y wget unzip apt-utils
WORKDIR /flatcam
RUN pwd
RUN wget https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.994_sources.zip
RUN pwd
RUN ls
RUN unzip FlatCAM_beta_8.994_sources.zip
RUN ls
WORKDIR /flatcam/FlatCAM_beta_8.994_sources
RUN pwd
RUN ls
RUN cat /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
# removing sudo since images are built as root
RUN sed -i 's/sudo//g' /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN cat /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN DEBIAN_FRONTEND=noninteractive sh -x /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh