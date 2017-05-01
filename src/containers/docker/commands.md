list names of running containers

`docker ps`

list names of all containers

`docker ps -a`

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
