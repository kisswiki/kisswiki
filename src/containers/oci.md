> We are excited to introduce Docker Engine 1.11, our first release built on runC ™ and containerd ™. With this release, Docker is the first to ship a runtime based on OCI technology
> With this release, Docker Engine is now built on containerd, so everyone who is using Docker is now using OCI.
> https://blog.docker.com/2016/04/docker-engine-1-11-runc/

> an open, standard container image format
> The reluctance from OCI can be attributed to the fact that the body was formed recently and they wanted to keep a very narrow focus on their goal.  But major players like VMWare, Google and Red Hat backed rkt by CoreOS, sending out a very a strong message. These heavyweight are also members of OCI, so their support for rkt and appc carried a lot of weight.
> This project is tasked with creating a software shipping container image format spec (OCI Image Format) with security and naming as components.
> http://www.cio.com/article/3057579/open-source-tools/open-container-initiative-addresses-docker-coreos-image-problem.html

> an industry-backed project under the OCI with a strong technical community of industry maintainers to standardize how container images are built, verified, signed, and named.
> package once, run anywhere
> users can expect increased innovation and interoperability between container registries, build tools, and runtimes
> https://coreos.com/blog/oci-image-specification.html

can be run by runC or rkt

> The OCI Image Format project creates and maintains the software shipping container image format spec (OCI Image Format). The goal of this specification is to enable the creation of interoperable tools for building, transporting, and preparing a container image to run.
> This specification defines how to create an OCI Image, which will generally be done by a build system, and output an image manifest, a filesystem serialization, and an image configuration. At a high level the image manifest contains metadata about the contents and dependencies of the image including the content-addressable identity of one or more filesystem serialization archives that will be unpacked to make up the final runnable filesystem. The image configuration includes information such as application arguments, environments, etc. The combination of the image manifest, image configuration, and one or more filesystem serializations is called the "OCI Image".
> This document outlines the OCI Image file format specifications, including the critical filesystem serialization and image manifest described above.
> The high level components of the spec include:
> - An image manifest and filesystem serialization (base layer)
> - A process of hashing the image format for integrity and content-addressing (base layer)
> - Signatures that are based on signing image content address (optional layer)
> - Naming that is federated based on DNS and can be delegated (optional layer)
> The OCI Image Format partner project is the OCI Runtime Spec project. The Runtime Specification outlines how to run a "filesystem bundle" that is unpacked on disk. At a high-level an OCI implementation would download an OCI Image then unpack that image into an OCI Runtime filesystem bundle. At this point the OCI Runtime Bundle would be run by an OCI Runtime.
>
> Q: Why doesn't this project mention distribution?
> A: Distribution, for example using HTTP as both Docker v2.2 and AppC do today, is currently out of scope on the OCI Scope Table. There has been some discussion on the TOB mailing list to make distribution an optional layer but this topic is a work in progress.
>
> Q: What happens to AppC or Docker Image Formats?
> A: Existing formats can continue to be a proving ground for technologies, as needed. The OCI Image Format project strives to provide a dependable open specification that can be shared between different tools and be evolved for years or decades of compatibility; as the deb and rpm format have.
> https://github.com/opencontainers/image-spec
