# FlatCAM

Project to support FlatCAM use on Windows via Docker deployment. 
Based on an the marcus2002/flatcam:1 image found on DockerHub

https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

## Requirements

1. DockerEngine with Linux support, i.e. DockerDesktop w/ WSL2
2. X11 server available via the network, i.e. VcXsrv

## Recommended Installation

### A. Install Chocolatey

Chocolatey is a Windows Package manager that will be used to install DockerDesktop and VcXsrv.

Please refer the official guide https://chocolatey.org/install

1. Start Administrative Powershell
2. Execute the following command 

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### B. Install WSL2

https://community.chocolatey.org/packages/wsl2

From Administrative Powershell
```
choco install wsl2 --params "/Version:2"
```

### C. Install DockerDesktop

https://community.chocolatey.org/packages/docker-desktop

1. Start Administrative Powershell
2. Execute
```
choco install docker-desktop
```
3. Reboot machine
4. Start DockerDesktop
5. Step through DockerDesktop tutuorial. It will demonstrate if the host is correctly configured.

### D. Install VcXsrv

VcXsrv is a X11 server used to display the GUI of FlatCAM running in the docker container. 
The after installation VcXsrv is configured to accept incomming network connections.
Later the ipaddress of the VcXsrv server is provide to the running docker container.
For this example the docker host and X11 server are the same physical machine so the ipaddress of workstation is provided.
Localhost and loop-back address, 127.0.0.1, can not be used because of how docker containers are networked.

Please refer to this blog post for more information 
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde

1. Start Administrative Powershell
2. Execute 
```
choco install vcxsrv
```
3. Launch Xlaunch application and follow initial configuration
4. Select display settings: Multiple windows
5. Select how to start clients: Start no client
6. Extra Settings: enable 'Disable access control'
7. Save configuration to Desktop 
8. In powershell execute below to find the ipaddress of the VcXsrv host
```
ipconfig
```
## Start FlatCam

At the command prompt execute the command below to start an instance of image marcus2002/flatcam:1.
Provide the ipaddress in the DISPLAY environment variable, for example -e DISPLAY=192.168.1.100:0.0. 
The trailing ':0.0' in the DISPLAY environment variable indicates the GUI should be rendered on the first display of the first screen and is required.

```
docker run -it --rm -e DISPLAY={IPADDRESS}:0.0 fazleskhan/flatcam:marcus2002-flatcam-copy 
```

## References

Project repo:
https://github.com/fazleskhan/FlatCAM

DockerHub repo:
https://hub.docker.com/r/fazleskhan/flatcam

Original DockerHub repo:
https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

Chocolatey installation:
https://chocolatey.org/install

Chocolatey WSL2 installation:
https://community.chocolatey.org/packages/wsl2

Chocolatey DockerDesktop installation:
https://community.chocolatey.org/packages/docker-desktop

Chocolatey VxSrv installation:
https://community.chocolatey.org/packages/vcxsrv

Displaying Docker container gui on Windows
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
=======
B. Install VcXsrv

VcXsrv is a X11 server used to display the GUI of FlatCAM running in the docker image. 
The after installation the server is configured to accept incomming network connections.
Later the ipaddress of the VcXsrv server is provide to the running docker container.
For this example the docker host and x11 server are the same so the ipaddress of docker host is used.

Please refer to this blog post for more information https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde

1. Start Administrative Powershell
2. Execute 'choco install vcxsrv'
3. Launch Xlaunch application and follow initial configuration
4. Select display settings: Multiple windows
5. Select how to start clients: Start no client
6. Extra Settings: enable 'Disable access control' 
7. Save configuration to Desktop (technically not needed)
8. In powershell execute 'ipfconfig' to find the ipaddress of the VcXsrv host

C. Install DockerDesktop

TBD

## Start FlatCam

At the command prompt execute to start copy of the original marcus2002/flatcam:1 image 

```
docker run -it --rm -e DISPLAY={IPADDRESS}:0.0 fazleskhan/flatcam:marcus2002-flatcam-copy 
```

