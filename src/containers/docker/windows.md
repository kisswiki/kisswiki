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
