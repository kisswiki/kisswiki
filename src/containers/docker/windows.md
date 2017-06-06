- https://docs.docker.com/docker-for-windows/install
- https://docs.docker.com/docker-for-windows

##

Note that if you are using docker toolbox (meaning docker through a VirtualBox VM), only /c/users/mylogin is available by default.
You need to declare other mount locations if your path does not include c:\Users\myLogin

https://stackoverflow.com/questions/40921097/how-to-mount-localhost-volume-to-a-docker-container-using-docker-compose

## tab-completion

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

and install tab-completion

https://docs.docker.com/docker-for-windows/#set-up-tab-completion-in-powershell

## Linux client

There is possibility to run Linux Docker client on Windows

https://serverfault.com/questions/767994/can-you-run-docker-natively-on-the-new-windows-10-ubuntu-bash-userspace/790806#790806

## use an in-development version of the Docker Engine and client

https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon#install-docker

## Windows7

### ERROR: for pm-back-end Cannot start service pm-back-end ... mounting caused ... not a directory

Put your repo in `C:\Users\<user>\<repo>` or [add share](https://stackoverflow.com/questions/30040708/how-to-mount-local-volumes-in-docker-machine/32030385#32030385).

Explanation:

> If you are using Docker Machine on Windows, docker has limited access to your Windows filesystem. By default Docker Machine tries to auto-share your C:\Users (Windows) directory.
> -- [Source](https://stackoverflow.com/questions/35995626/docker-compose-share-volume-nginx/35996896#35996896)

BTW. You don't need to set `COMPOSE_CONVERT_WINDOWS_PATHS=1` like [here](https://stackoverflow.com/questions/41318252/running-a-docker-compose-getting-started-example-causes-invalid-volume-specif).

### http://localhost:3001 unavailable

Add `C:\Program Files\Oracle\VirtualBox\` to `%PATH%`. Restart shell.

Create port forwarding rule: `VBoxManage controlvm "default" natpf1 "tcp-port3001,tcp,,3001,,3001"`

You may need need to create such rules for other ports as well.

- https://stackoverflow.com/questions/36385402/docker-os-x-forward-localhost-22-port-to-container-2022-port
