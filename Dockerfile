# Copied from marcus2002/flatcam:1
# https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

FROM ubuntu:bionic-20200403
RUN /bin/sh -c apt-get update && apt-get install -y curl wget git gnupg2 gnupg
RUN /bin/sh -c apt-get install -y build-essential linux-headers-$(uname -r) dkms
ENV LANG=C.UTF-8
RUN /bin/sh -c wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
             && chmod +x Miniconda3-py38_4.10.3-Linux-x86_64.sh \
             && ./Miniconda3-py38_4.10.3-Linux-x86_64.sh  -b -p /miniconda
ENV PATH=/miniconda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/sh -c apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
RUN /bin/sh -c conda env create -f flatcam-conda-env.yaml
RUN /bin/sh -c git clone https://bitbucket.org/jpcgt/flatcam \
             && cd flatcam \
             && git checkout origin/Beta
WORKDIR /gerbers             
CMD ["/bin/sh" "-c" "\"/flatcam/flatcam.sh\""]