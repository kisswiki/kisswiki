list running containers names

`docker ps`

list all containers names

`docker ps -a`

list running containers ids

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
