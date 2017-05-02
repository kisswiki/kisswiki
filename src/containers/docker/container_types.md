## About Docker isolation

> Docker uses the resource isolation features of the [..] kernel [..] to allow independent "containers" to run within a single [kernel] instance, avoiding the overhead of starting and maintaining virtual machines.
> -- https://en.wikipedia.org/wiki/Docker_%28software%29

## Linux containers

Docker containers use host's kernel and since you cannot run linux processes on Windows kernel, Docker installs MobyLinux in Hyper-V container. MobyLinux is then a host to Docker Linux containers which share linux kernel from MobyLinux.

Docker for Windows is set to Linux containers by default. It is just starting up a Linux VM using HyperV, running the Docker daemon in that VM, and handling any of the hoops you'd normally have to jump through in order to connect your local Docker client to that daemon and not one VM per container.

https://github.com/docker/for-win/issues/6#issuecomment-247836101

## Windows containers

When you click "Switch to Windows containers" you should be able to run Windows containers.

Hyper-V container with Windows will be a host to other Windows containers.

There are some networking problems with connecting to docker after switching to "Windows containers".

Solution might be to remove MobyLinux container from Hyper-V.

To run Windows containers and Linux continers in the same time you probably need to install Docker for Windows beta.

To allow windows and linux containers communicate, use swarm.

## Window Server Containers

Windows Server Containers (shared kernel) and Windows Hyper-V containers (lightweight Hyper-V VM per container) images are interchangeable, i.e. the same Windows Container image can be run in either mode.

Docker Hub can store, and already has, both Linux and Windows container images.

https://github.com/docker/for-win/issues/6#issuecomment-247826691

To get rid of virtualization in the form of Hyper-V and run Windows containers on bare-metal Windows kernel, you can use Windows Server Containers available on Windows Server.

https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/
