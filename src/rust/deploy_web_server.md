- build a statically-linked binary with musl https://blog.rust-lang.org/2016/05/13/rustup.html
- Deploying a Rust application https://www.clever-cloud.com/doc/docker/docker/
- https://www.distelli.com/docs/tutorials/build-and-deploy-rust-application
- http://www.arewewebyet.org/topics/deploy/
- https://github.com/fnichol/docker-rust
- https://github.com/Scorpil/docker-rust

## Use docker or install compiler on production machine?

> it's not a very good process to use resources of the production system to build your project
> https://www.reddit.com/r/rust/comments/46z75s/deploying_a_web_server_written_in_rust/

<br>

> I think it is a mistake to deploy with the compiler (+other devtools). A better setup would be to have one container for building, and the copy the built executable (+dependencies) over to the container/image that will be deployed.
> https://www.reddit.com/r/rust/comments/2ea935/deploying_rust_apps_with_docker/cjxmhw2

<br>

> While you are strongly encouraged to repackage a smaller Docker image with your compiled app for production use, it may be useful to run your app in development
> https://github.com/fnichol/docker-rust

<br>

> What benefit would Docker images have over the existing upstream distribution or distro packaging? The Rust compiler doesn't have any particularly complicated dependencies, either installing the binaries directly from rust-lang.org or installing packages from your distro (if your distro has packages yet) should work fine.
> Container images are great for daemons with possibly complicated dependency sets that might have conflicting version requirements with other packages and can benefit from isolation from other packages that containerization gives, but seem like a pretty heavyweight solution for just installing a compiler.
> https://news.ycombinator.com/item?id=10711255

<br>

> One benefit: one could install latest version of Rust on any distribution. Debian stable for instance usually lags behind (with good reason, but still...)
> The installer from https://www.rust-lang.org works fine on Debian stable. Right now, you can just use the upstream rustup.sh script for platforms that don't yet have it packaged (like Debian stable), or install from your distro for those that do (or use rustup.sh on those as well if you like).

<br>

> If I don't like having Rust around, with containers I can just remove it
> rustup.sh has an --uninstall flag that should remove everything cleanly
> Should. It wouldn't be the first script to have a bug.
> https://news.ycombinator.com/item?id=10720239

<br>

> good for testing services like travis
> travis could also test statically compiled binary
> but with container you also test with your binary will build in isolated environment
> but there could be problem with installing dependencies not related to your program
> https://docs.travis-ci.com/user/docker/

<br>

> Binaries are one thing, but there are the other abstractions that containers bring in regard to networking and storage.
> You expose what are the network APIs of your apps (e.g open ports), filesystem mounts, variables (12 factors), etc.
> Your application becomes a block that you can assemble for a particular deployment; add some environment variables, connect a volume with a particular driver to a different storage backend, connect with an overlay to be able to talk to other containers privately across different servers or even DCs, etc.
> https://news.ycombinator.com/item?id=12304572

<br>

> For example, volumes: With Kubernetes (on Docker), the lifetime of the volume mount is handled for you. No other containers have access to the mount. Container dies, mount dies. Whereas on plain Linux, mounts stay. You need cleanup, or you need to statically bind apps to their machines, which will seriously limit your ability to launch new machines -- there will be a lot of state associated with the bootstrapping of each node. Statefulness is the enemy of deployment, so really what you want is some networked block storage (EBS on AWS, for example) plus an automatic mount/unmount controller, thereby decoupling the app from the machine and allowing the app to run anywhere.
> Environment vars are inherited and follow the process tree, so those are solved by Linux itself.
> Process trees also handle "nesting": Parent dies, children die. But you will end up in a situation where a child process might spawn a child process that detaches. This is particularly hard to fix when a parent terminates, because the child doesn't want to be killed. Now you have orphaned process trees. The Linux solution is called cgroups, which allows you to associate process trees with groups, which children cannot escape from. So you use cgroups, and write state management code to clean up an app's processes.
> https://news.ycombinator.com/item?id=12306457

<br>

> It's about the automation of these things.
You now have generic interfaces (Dockerfile, docker-compose, Kubernetes/Rancher templates, etc.) to define your app and how to tie it together with the infrastructure.
> https://news.ycombinator.com/item?id=12305164

<br>

> In my humble case, Docker solves the problems I have to manage the systems on which my application runs (and that's mainly it). A single dockerfile of 20-30 lines describes a whole system (operating system, versions, packages, libraries, etc), and cherry on the cake, I can version it in my git repository.
> This is not revolutionary in itself, but having the creation and deployment of a server being 100% replicable (+ fast and easy!) on dev, preproduction, and production environments, plus it's managed with my usual versionning tool, that is something I appreciate very much.
> https://news.ycombinator.com/item?id=12305967

<br>

>> having the creation and deployment of a server being 100% replicable
> The problem of ensuring that upstream dependencies can be reproducibly installed and/or built is, of course, left as an exercise for the reader.
> https://news.ycombinator.com/item?id=12309162

<br>
>> Isolation is a strong argument. You don't want one process to starve another. You can get isolation via one-host-per-service or you can get it using cgroups. Docker sort of gives you both, without the waste of one-per-host and with a manageable set of tooling around cgroups.
> systemd runs services in their own cgroup by default and gives you control over the resources alloted to those cgroups.
> https://news.ycombinator.com/item?id=12305790
