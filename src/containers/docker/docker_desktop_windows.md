## Tutorial

Will be start on first run of Docker Desktop. To run manually:

Tray Icons > Docker > Right click > Learn

You can also view tutorial in the browser https://github.com/docker/getting-started.

## Commands

```shell
$ docker ps -a
# create and run command in a container https://stackoverflow.com/questions/31697828/docker-error-name-is-already-in-use-by-container/35803484#35803484 
$ docker run ...
# enter a running container https://stackoverflow.com/questions/20932357/how-to-enter-in-a-docker-container-already-running-with-a-new-tty/26496854#26496854
$ docker exec -it [container-id] bash
```

## Windows and Linux containers

By default Docker Desktop runs Linux containers.

So we have Hyper-V -> DockerDesktopVM (previously MobyLinuxVM) -> container which shares kernel with DockeDesktopVM.

You can see VMs in Hyper-V by running Hyper-V Manager.

DockerDesktopVM is probably based on https://github.com/linuxkit/linuxkit.

You cannot run run Windows containers alongside Linux containers in "Linux containers" mode.

You can switch to "Windows containers" mode. Then you can enable expermintal features and run Linux containers alongside Windows containers as LCOW (Linux container on Windows).

But every Linux container will be run in Hyper-V isolation mode https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/hyperv-container.

Microsoft now recommends WSL2 instead of LCOW https://github.com/docker/for-win/issues/6470#issuecomment-620466429 https://docs.microsoft.com/en-us/windows/nodejs/containers.

- https://medium.com/@waelkdouh/demystifying-docker-containers-support-on-windows-10-and-windows-server-2016-592f1c09a5e1
- https://stackoverflow.com/questions/49688700/why-does-docker-for-windows-make-you-pick-either-windows-or-linux-containers