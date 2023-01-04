FROM fazleskhan/flatcam:marcus2002-flatcam-copy
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y