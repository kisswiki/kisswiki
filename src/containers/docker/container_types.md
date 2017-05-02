## About Docker isolation

> Docker uses the resource isolation features of the [..] kernel [..] to allow independent "containers" to run within a single [kernel] instance, avoiding the overhead of starting and maintaining virtual machines.
> -- https://en.wikipedia.org/wiki/Docker_%28software%29

## 

Windows container images can be run on two different types of Container engines, either as native Windows Server containers (where they run on the same kernel as the host, shared kernel) or as Windows Hyper-V containers, which utilises a lightweight windows VM on top of Hyper-V to execute the container. Note, the latter VM is a different VM to the Linux VM, Docker for Windows uses to run Linux container.

https://github.com/docker/for-win/issues/6#issuecomment-247837186

## Linux containers

Docker containers use host's kernel and since you cannot run linux processes on Windows kernel, Docker installs MobyLinux in Hyper-V container. MobyLinux is then a host to Docker Linux containers which share linux kernel from MobyLinux.

If you start your: Hyper-V Manager program, you'll be able to see it.

https://forums.docker.com/t/linux-container-on-windows-docker-host/25884/2

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

- https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/
- http://windowsitpro.com/windows-server-2016/differences-between-windows-containers-and-hyper-v-containers-windows-server-201
- https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10
