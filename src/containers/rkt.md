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
