# CBL-Mariner 2.0 base image for WSL2

[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](http://www.wtfpl.net/about/)
![GitHub last commit](https://img.shields.io/github/last-commit/INCT-DD/cblmariner-wsl2)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/INCT-DD/cblmariner-wsl2/CBL-Mariner%20-%20WSL2)

## DESCRIPTION

This is a simple image based on CBL-Mariner 2.0 that incorporates into the provided Docker image the base tools required to run a full server instead of a purpose-built container. Please note that if you want to run simple containers **THIS IS NOT THE IMAGE YOU'RE LOOKING FOR**.

To run containers based on CBL-Mariner please use Microsoft's official container base image. Ex.:

```Dockerfile
FROM cblmariner.azurecr.io/base/core:2.0

...
```

This will give you a relatively small (~68MB) base image upon which you can build your containers.

We provide this image for three main reasons:

1. If you wan't to run CBL-Mariner containers on CBL-Mariner and need a testing platform;
2. So users can get used to the process of designing and running servers using CBL-Mariner, and;
3. Because it's fun.

Please note that CBL-Mariner relies on a very small package repository when compared with other Enterprise Linux distributions (ex.: RHEL) so you might have to compile your own packages in which case having a WSL2 ready base image will help your test and debug process.

Nvidia drivers and Docker integration should work out of the box.

## INSTALLATION

Installing this distribution is easy and straightforward:

1. Create a directory where WSL will store the filesystem for this distribution:

```Powershell
mkdir C:\WSL\CBL-Mariner
```

2. Pull the image from Docker Hub:

```Powershell
docker pull alexandreteles/cblmariner:2.0
```

3. Create a container:

```Powershell
docker create --name cblmariner -t -i alexandreteles/cblmariner:2.0 bash 
```

4. Export the container:

```Powershell
docker export --output="cblmariner.tar" cblmariner
```

5. Import the image into WSL:

```Powershell
wsl --import CBL-Mariner C:\WSL\CBL-Mariner ./cblmariner.tar
```

WSL will create a `VHDX` virtual disk, import the `.tar` file and expand the filesystem into it (~730MB). Once the process is completed you can start the container as usual, be it directly from the WSL shell or from a Windows terminal.

## ADDITIONAL INFORMATION

Below you'll find a list of the additional packages included on top of the `core-packages-container` already included on the Docker base image:

| Packages                 |
| ------------------------ |
| core-packages-base-image |
| cracklib-dicts           |
| at                       |
| man                      |
| python3-pip              |
| acl                      |
| bash-completion          |
| binutils                 |
| nano                     |
| vim                      |

For more information about the packages intalled by the meta-package `core-packages-base-image` or about CBL-Mariner in general, please refer to the official GitHub repository for the project at https://github.com/microsoft/CBL-Mariner
