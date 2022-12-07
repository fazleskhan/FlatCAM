FROM ubuntu
RUN pwd
RUN apt update
RUN apt install -y sudo wget unzip
WORKDIR /flatcam
RUN wget https://bitbucket.org/jpcgt/flatcam/downloads/FlatCAM_beta_8.994_sources.zip
RUN pwd
RUN ls
RUN unzip FlatCAM_beta_8.994_sources.zip
RUN ls
WORKDIR /flatcam/FlatCAM_beta_8.994_sources
RUN pwd
RUN ls
RUN cat /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
# https://stackoverflow.com/questions/51023312/docker-having-issues-installing-apt-utils
RUN sed -i 's/apt-get/DEBIAN_FRONTEND=noninteractive apt-get/g' /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN cat /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
# https://stackoverflow.com/questions/68673221/warning-running-pip-as-the-root-user
RUN sed -i 's/pip install/pip install --root-user-action=ignore/g' /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN cat /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
# https://packaging.python.org/en/latest/discussions/pip-vs-easy-install/
# easy-installs is depricated and the previous command does not do anything
RUN sed -i 's/sudo -H easy_install -U distribute//g' /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh
RUN DEBIAN_FRONTEND=noninteractive sh -x /flatcam/FlatCAM_beta_8.994_sources/setup_ubuntu.sh