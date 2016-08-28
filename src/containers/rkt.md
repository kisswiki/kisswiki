## pull/fetch images

- https://coreos.com/rkt/docs/latest/subcommands/fetch.html

> The easiest way to fetch an ACI is through meta discovery. rkt will find and download the ACI and signature from a location that the creator has published on their website.
> https://github.com/appc/spec/blob/master/spec/discovery.md

> I know a number of folks are working on supporting OCI Images in their
> Docker registries. To make it possible to test we have added support to pull
> OCI images from a Docker registry to rkt. To test it out run:
> rkt fetch docker://my-oci-registry.example.com:v1.0.0
> https://groups.google.com/a/opencontainers.org/forum/#!topic/dev/KwhsI87ezaA
