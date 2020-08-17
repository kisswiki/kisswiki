## To change HostPort of a container on Windows 10

You can define HostPort when using `docker run` or `docker create`. Later you can't change it using `docker start`.

- Stop the container

```bash
# list all containers
$ docker ps -a
# Use grep or rg to get Id of container
$ docker inspect docker101tutorial | grep -i id
        "Id": "sha256:fff0a4b22d6f3d2eb8d2748b8a8bbc9967ea87199988acee8e86ac70bce9c3eb",
# run plain ubuntu docker image with shell and change it's namespace to docker host
# https://stackoverflow.com/questions/60408574/how-to-access-var-lib-docker-in-windows-10-docker-desktop/60411313#60411313
# https://forums.docker.com/t/the-location-of-images-in-docker-for-windows/19647/4
$ docker run -it --privileged --pid=host ubuntu nsenter -t 1 -m -u -i sh
# We want to find out the directory of docker101tutorial container. We are looking for:
# `"Image":"sha256:fff0a4b22d6f3d2eb8d2748b8a8bbc9967ea87199988acee8e86ac70bce9c3eb"`
# in /var/lib/docker/containers/*/config.v2.json
$ grep -rl fff0a4b22d /var/lib/docker/containers/
/var/lib/docker/containers/6e0418c568e9cbb9e941de5d6c1863685250707c6e3cc327adf248680f29697b/6e0418c568e9cbb9e941de5d6c1863685250707c6e3cc327adf248680f29697b-json.log
/var/lib/docker/containers/c1eda20b30f058bce9f8ece3b47a21641df5b399770e12ab57416a954d3c8bbf/config.v2.json
# So it is c1eda20b30f058bce9f8ece3b47a21641df5b399770e12ab57416a954d3c8bbf directory. Let's change HostPort:
$ vi /var/lib/docker/containers/c1eda20b30f058bce9f8ece3b47a21641df5b399770e12ab57416a954d3c8bbf/hostconfig.json
```

- Press `i` for insert mode. 
- Change `"HostPort":"80"` to `"HostPort":"8092"`
- Press `Escape` and write `:wq`. Press `Enter`.
- Do not start/stop `docker101tutorial` now. Otherwise changes to `HostPort` will be reverted.
 - `Tray Icons > right click Docker Desktop > Restart`.
 - Start your container. Now it will be mapped to port 8092  on host.

Based on @holdfenytolvaj answer.

- https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container/63455911#63455911