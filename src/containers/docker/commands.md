list names of running containers

`docker ps`

list names of all containers

`docker ps -a`

http://stackoverflow.com/questions/16840409/how-do-you-list-containers-in-docker-io

list ids of running containers

`docker ps -q`

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
