> What benefit would Docker images have over the existing upstream distribution or distro packaging? The Rust compiler doesn't have any particularly complicated dependencies, either installing the binaries directly from rust-lang.org or installing packages from your distro (if your distro has packages yet) should work fine.
> Container images are great for daemons with possibly complicated dependency sets that might have conflicting version requirements with other packages and can benefit from isolation from other packages that containerization gives, but seem like a pretty heavyweight solution for just installing a compiler.
> https://news.ycombinator.com/item?id=10711255

<br>

> tools like kubernetes, which are really useful if you're deploying a number of heterogeneous apps
> Something like kubernetes also lets you abstract away the lock-in of your cloud infrastructure
> https://news.ycombinator.com/item?id=12307950

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

>> The Linux solution is called cgroups, which allows you to associate process trees with groups, which children cannot escape from. So you use cgroups, and write state management code to clean up an app's processes.
>> Isolation is a strong argument. You don't want one process to starve another. You can get isolation via one-host-per-service or you can get it using cgroups. Docker sort of gives you both, without the waste of one-per-host and with a manageable set of tooling around cgroups.
> systemd runs services in their own cgroup by default and gives you control over the resources alloted to those cgroups.
> https://news.ycombinator.com/item?id=12305790

<br>

> Namespaced FS as in chroot.
> Your program don't see what else is running on the system. Also means that it removes possible conflicts for shared libraries and other system-wide dependencies.
> This kind of isolation is not only good for app bundling as a developer, but even more important as an operator in a multi-tenant scenario. You throw in containers and they don't step on each other toes. Plus, system stay clean and it's easy to move things around.
> Each container has it's own IP stack.
> Containers provide proper abstractions so you can then assemble all of this, pretty much like you use pipes on a unix shell.
> https://news.ycombinator.com/item?id=12305540

<br>

> I get the goodies of containerization such as process isolation, resource-quotas, etc.
> https://news.ycombinator.com/item?id=12305031

<br>

> Docker containers don't contain a kernel. A container isn't anything special -- it's "just" a namespaced set of processes that are isolated from the host system. If you run "ps" on the host, you will see all the containers' processes.
> One process per container is perfectly fine. In fact, that's the common use case. There is absolutely nothing wrong with it, and there is practically zero overhead in doing it.
> What you gain is isolation. I can bring up a container and know that when it dies, it leaves no cruft behind. I can start a temporary Ubuntu container, install stuff in it, compile code in it, export the compilation outputs, terminate the container and know that everything is gone. We do this with Drone, a CI/build system that launches temporary containers to build code. This way, we avoid putting compilers in the final container images; only the compiled program ends up there.
> Similarly, Drone allows us to start temporary "sidecar" containers while running tests. For example, if the app's test suite needs PostgreSQL and Memcached and Elasticsearch, our Drone config starts those three for the duration of the test run. When the test completes, they're gone.
> This encapsulation concept changes how you think about deployment and about hardware. Apps become redundant, expendable, ephemeral things. Hardware, now, is just a substrate that an app lives on, temporarily. We shuffle things around, and apps are scheduled on the hardware that has enough space. No need to name your boxes (they're all interchangeable and differ only in specs and location), and there's no longer any fixed relationship between app and machine, or even between app and routing. For example, I can start another copy of my app from an experimental branch, that runs concurrently with the current version. All the visitors are routed to the current version, and I can privately test my experimental version without impacting the production setup. I can even route some of the public traffic to the new version, to see that it holds up. When I am ready to put my new version into production, I deploy it properly, and the system will start routing traffic to it.
> Yes, it very much is the future.
> https://news.ycombinator.com/item?id=12306210

<br>

> The application container, a method of software packaging that bundles application code with the dependencies it needs to run properly, is the first point where designing for the hybrid scenario helps control complexity. The container image, a file or file system package, serves as the objective application artifact for distribution. When executed, the container is isolated in a manner that reflects its self-sufficiency, both protected and barred from access to or from the operating system layer and other containers executing on the same node. Decoupling the application layer from the operating system and libraries below it allows both sides of the container isolation wall to be updated more frequently, without worrying about breaking interconnections between the two.
> https://www.infoq.com/articles/hybrid-cloud-complexity
