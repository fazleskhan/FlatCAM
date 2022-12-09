# FlatCAM

Project to support FlatCAM use on Windows via Docker deployment. 
Based on an the marcus2002/flatcam:1 image found on DockerHub

https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

## Requirements

1. DockerEngine with Linux support, i.e. DockerDesktop
2. X11 server available via the network, i.e. VcXsrv

## Recommended Installation

### A. Install Chocolatey

Chocolatey is a Windows Package manager that will be used to install DockerDesktop and VcXsrv.

Please refer the official guide https://chocolatey.org/install

### B. Install WSL2

From Administrative Powershell
```
choco install wsl2 --params "/Version:2"
```

### C. Install DockerDesktop

1. Start Administrative Powershell
2. Execute
```
choco install docker-desktop
```
3. Reboot machine
4. Start DockerDesktop
5. Step through DockerDesktop tutuorial because it will make sure the host is correctly configured.

### D. Install VcXsrv

VcXsrv is a X11 server used to display the GUI of FlatCAM running in the docker image. 
The after installation the server is configured to accept incomming network connections.
Later the ipaddress of the VcXsrv server is provide to the running docker container.
For this example the docker host and x11 server are the same so the ipaddress of docker host is used.

Please refer to this blog post for more information https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde

1. Start Administrative Powershell
2. Execute 
```
choco install vcxsrv
```
3. Launch Xlaunch application and follow initial configuration
4. Select display settings: Multiple windows
5. Select how to start clients: Start no client
6. Extra Settings: enable Disable access control 
7. Save configuration to Desktop 
8. In powershell execute below to find the ipaddress of the VcXsrv host
```
ipconfig
```
## Start FlatCam

At the command prompt execute to start copy of the original marcus2002/flatcam:1 image 

```
docker run -it --rm -e DISPLAY={IPADDRESS}:0.0 fazleskhan/flatcam:marcus2002-flatcam-copy 
```

## References

https://hub.docker.com/r/fazleskhan/flatcam

https://github.com/fazleskhan/FlatCAM
