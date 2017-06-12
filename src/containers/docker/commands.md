## run

```
docker run hello-world
docker run -it ubuntu bash
docker run -d -p 80:80 --name webserver nginx
```

- https://docs.docker.com/engine/reference/run
- https://docs.docker.com/docker-for-windows

## run and remove container after exiting

`docker run --rm hello-world`

## ps

list names of running containers

`docker ps`

list names of all containers

`docker ps -a`


list ids of running containers

`docker ps -q`

 list all docker containers created after container named cocky_jang

`docker ps --since="cocky_jang"`

list docker containers created before a specific container

`docker ps --before="mycentos"`

- https://docs.docker.com/engine/reference/commandline/ps/
- http://stackoverflow.com/questions/16840409/how-do-you-list-containers-in-docker-io
- https://linuxconfig.org/how-to-list-available-docker-containers-using-ps-command-on-linux

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

## inspect

```shell
docker inspect -f "{{ .NetworkSettings.Networks }}" musicstore_web_1
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" musicstore_web_1
docker inspect -f "{{ .NetworkSettings.Networks.bridge.IPAddress }}" musicstore_web_1
```

## Restart exited container

show all

`docker ps -a`

restart

`docker restart <container_name_or_hash>`

If name is `sth/sth2` then name to restart is `sth2`.

https://www.reddit.com/r/docker/comments/4axndi/newbie_what_is_the_command_to_rerun_docker/d14oxbo/
