## quickstart

```
docker run hello-world
docker run -it ubuntu bash
docker run -d -p 80:80 --name webserver nginx
```

- https://docs.docker.com/docker-for-windows

## ps

list names of running containers

`docker ps`

list names of all containers

`docker ps -a`


list ids of running containers

`docker ps -q`

- https://docs.docker.com/engine/reference/commandline/ps/
- http://stackoverflow.com/questions/16840409/how-do-you-list-containers-in-docker-io

## remove containers that exited

bash:

```bash
docker rm $(docker ps -q -f status=exited)
```

powershell:

```powershell
docker rm @(docker ps -q -f status=exited)
```

http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-containers

## get shell in running container

`docker exec -it <containerIdOrName> bash`

- https://askubuntu.com/questions/505506/how-to-get-bash-or-ssh-into-a-running-container-in-background-mode
- https://docs.docker.com/engine/reference/commandline/exec/
