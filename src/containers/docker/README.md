- https://github.com/wsargent/docker-cheat-sheet
- https://github.com/docker/docker/wiki/Public-docker-images
- https://getcarina.com/docs/tutorials/run-docker-image/

## About

> In terms of resource consumption Docker is just a neat wrapper over some functionality that is built in to the kernel, there is no "vm" of any sort, which is a common misconception.
> https://news.ycombinator.com/item?id=10712078

<br>

> It's all about simplifying deployment. That's it, that's what's so good about using containers.
> https://news.ycombinator.com/item?id=12304165

<br>

> Docker containers don't contain a kernel. A container isn't anything special -- it's "just" a namespaced set of processes that are isolated from the host system. If you run "ps" on the host, you will see all the containers' processes.
> https://news.ycombinator.com/item?id=12306210

<br>

> What you gain is isolation
> https://news.ycombinator.com/item?id=12306210

<br>

> On March 13, 2014, with the release of version 0.9, Docker dropped LXC as the default execution environment and replaced it with its own libcontainer library written in the Go programming language.
> https://en.wikipedia.org/wiki/Docker_(software)

<br>

> Containers are basically glorified user groups
> https://bobcares.com/blog/rkt-rocket-container-technology-use/

<br>

> Docker introduced containerd, a daemon to control runC, as part of their effort to break out Docker into small reusable components.
> https://jaxenter.com/docker-1-11-ties-its-fate-to-open-container-initiative-125603.html

- Official Repositories on Docker Hub https://docs.docker.com/docker-hub/official_repos/
  - https://hub.docker.com/explore/

## Windows

- https://docs.docker.com/registry/insecure/
- https://docs.docker.com/docker-for-windows/
- http://stackoverflow.com/questions/33532138/docker-pull-push-not-working-with-insecure-registry

## Windows Subsystem for Linux with Ubuntu

> Can't. Kernel must be 3.10 at minimum to run docker on Ubuntu. When we run uname -r the output is 3.4.0+
> https://stapp.space/how-to-setup-bash-on-windows/

<br>

> Docker requires a 64-bit installation regardless of your Ubuntu version. Additionally, your kernel must be 3.10 at minimum.
> https://docs.docker.com/engine/installation/linux/ubuntulinux/

## Registry

- Store images on Docker Hub https://docs.docker.com/engine/tutorials/dockerrepos/
- http://stackoverflow.com/questions/26710153/remote-access-to-a-private-docker-registry
- https://blog.codecentric.de/en/2014/02/docker-registry-run-private-docker-image-repository/

> Docker.com hosts its own index to a central registry which contains a large number of repositories. Having said that, the central docker registry does not do a good job of verifying images and should be avoided if you're worried about security.
> https://github.com/wsargent/docker-cheat-sheet#registry--repository

## Build from github

> Git URLs accept context configuration in their fragment section, separated by a colon :. The first part represents the reference that Git will check out, this can be either a branch, a tag, or a commit SHA. The second part represents a subdirectory inside the repository that will be used as a build context.

```bash
# docker build url#git_ref:subdir
docker build https://github.com/docker/rootfs.git#container:docker
```

- https://docs.docker.com/engine/reference/commandline/build/
- http://stackoverflow.com/questions/26753030/how-to-build-docker-image-from-github-repository

## 2019-12-27

In build phase there is no access to volume.u

Volume is created on host.

You can mount to host but cannot provide relative path

## vscode

- https://code.visualstudio.com/docs/remote/containers
- https://github.com/Microsoft/vscode-docker

## docker echo command output build

`--progress=plain --no-cache` is needed. Example:

`docker build --progress=plain --no-cache --platform linux/arm64 --tag 'test2' .`

- https://stackoverflow.com/questions/64804749/why-is-docker-build-not-showing-any-output-from-commands/64805337#64805337
