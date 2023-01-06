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

At the command prompt execute the command below to start an instance of image fazleskhan/flatcam:dev. 

```
docker compose up

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

Enabling Remote Desktop on container
https://www.tek-tools.com/database/how-to-access-linux-desktop-remotely
