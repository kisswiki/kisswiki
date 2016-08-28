- https://coreos.com/rkt/
- https://github.com/coreos/rkt
- https://coreos.com/rkt/docs/latest/rkt-vs-other-projects.html

## pull/fetch images

- https://coreos.com/rkt/docs/latest/subcommands/fetch.html

> The easiest way to fetch an ACI is through meta discovery. rkt will find and download the ACI and signature from a location that the creator has published on their website.
> https://coreos.com/rkt/docs/latest/subcommands/fetch.html

<br>

> Image Discovery locates the templates using HTTPS+HTML meta tags retrieved from a discovery URL
> https://github.com/appc/spec/blob/master/spec/discovery.md

<br>

> I know a number of folks are working on supporting OCI Images in their
> Docker registries. To make it possible to test we have added support to pull
> OCI images from a Docker registry to rkt. To test it out run:
> rkt fetch docker://my-oci-registry.example.com:v1.0.0
> https://groups.google.com/a/opencontainers.org/forum/#!topic/dev/KwhsI87ezaA

<br>

> rkt uses HTTPS protocol to download images and uses a meta description on the web server to point to the location. So, that’s one less server to maintain, and easier for partners to access.
> HTTPS is just one way to distribute ACI files. Using rkt torrent pull command, images can be downloaded over torrents.
> https://bobcares.com/blog/docker-vs-rkt-rocket/2/

<br>

> rkt includes the same functionality as runC but does not expect a user to understand low-level details of the operating system to use, and can be invoked as simply as rkt run coreos.com/etcd,version=v2.2.0. It can download both “Docker Images” and “App Container Images”. As rkt does not have a centralized daemon it can also be easily integrated with init systems such as upstart and systemd.
> https://coreos.com/rkt/docs/latest/rkt-vs-other-projects.html

## root

> Docker runs with super-user privileges (aka “root”), and spins off new containers as its sub-process. The issue with that is, a vulnerability in a container, or poor containment can give an attacker root level access to the whole server. CVE-2014-9357 was one such vulnerability.
Sure, Docker always recommended running containers within SELinux or AppArmor, but many server owners consider it too complicated, and skip the step.
Rkt came up with a better solution where new containers are never created from a root privileged process. In this way, even if a container break-out happens, the attacker cannot get root privileges.
> https://bobcares.com/blog/docker-vs-rkt-rocket/
