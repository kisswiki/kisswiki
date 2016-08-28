> We are excited to introduce Docker Engine 1.11, our first release built on runC ™ and containerd ™. With this release, Docker is the first to ship a runtime based on OCI technology
> With this release, Docker Engine is now built on containerd, so everyone who is using Docker is now using OCI.
> https://blog.docker.com/2016/04/docker-engine-1-11-runc/

oci is an container image format which can bu run by runC or rkt

> The OCI Image Format project creates and maintains the software shipping container image format spec (OCI Image Format). The goal of this specification is to enable the creation of interoperable tools for building, transporting, and preparing a container image to run.
> This specification defines how to create an OCI Image, which will generally be done by a build system, and output an image manifest, a filesystem serialization, and an image configuration. At a high level the image manifest contains metadata about the contents and dependencies of the image including the content-addressable identity of one or more filesystem serialization archives that will be unpacked to make up the final runnable filesystem. The image configuration includes information such as application arguments, environments, etc. The combination of the image manifest, image configuration, and one or more filesystem serializations is called the "OCI Image".
> The OCI Image Format partner project is the OCI Runtime Spec project. The Runtime Specification outlines how to run a "filesystem bundle" that is unpacked on disk. At a high-level an OCI implementation would download an OCI Image then unpack that image into an OCI Runtime filesystem bundle. At this point the OCI Runtime Bundle would be run by an OCI Runtime.
> Q: What happens to AppC or Docker Image Formats?
> A: Existing formats can continue to be a proving ground for technologies, as needed. The OCI Image Format project strives to provide a dependable open specification that can be shared between different tools and be evolved for years or decades of compatibility; as the deb and rpm format have.
> https://github.com/opencontainers/image-spec
