# FlatCAM

Project to support FlatCAM use on Windows via Docker deployment. 
Based on an the marcus2002/flatcam:1 image found on DockerHub

https://hub.docker.com/layers/marcus2002/flatcam/1/images/sha256-b1c7672de57cec8e36c9e5f122795cfa1a354e635bead9727bb80d564a4d2d5f?context=explore

## Requirements

1. DockerEngine with Linux support, i.e. DockerDesktop w/ WSL2

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


TBD

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

Displaying Docker container gui on Windows
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
