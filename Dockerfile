FROM ubuntu
RUN pwd
RUN apt update && apt upgrade
RUN apt install wget
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
RUN sh -x /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh