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

## Binary size

https://lifthrasiir.github.io/rustlog/why-is-a-rust-executable-large.html#takeaway

## Musl

> It's probably stack overflow. Unfortunately musl libc has small stack (80kib) but rust usually relies on large stack (order of megabytes). I could not find easy way to change the stack size previously.
> https://github.com/tailhook/vagga/issues/116#issuecomment-154092087

<br>

> musl has some kernel ABI version requirements
>
> https://www.musl-libc.org/faq.html Says 2.6 officially, due to some threading stuff on earlier versions. Should work on anything later though.
>
> Where I was skeptical was around new features added to the kernel. I do not know how careful musl is when it is built on a kernel which includes a new feature (say something like F_DUPFD_CLOEXEC, added in 2.6.24), but is then copied and run on an older kernel (2.6.10) which would return -EINVAL from that system call.
> A quick glance at the musl sources shows that in this particular case musl is careful to notice the -EINVAL and emulate it (via F_DUPFD and F_SETFD FD_CLOEXEC).
> But without seeing documentation from musl that this is guaranteed for everything that could be added in later kernels (I'm not even sure everything added could be emulated easily, but perhaps it could be), then I'd still be skeptical making the claim that musl and Rust could be statically linked on any version of Linux after 2.6 and run on any other version of Linux after 2.6.
> It's not really about the kernel ABI being compatible (programs built on older kernels run on newer ones quite nicely). It's about newer features from newer kernels still being supported (or their absence detected and their features emulated) on older kernels. That's a property of musl, not of the kernel.
> https://news.ycombinator.com/item?id=11691980

## Dockerfile

```
FROM geal/archlinux-rust
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

ADD . /source
WORKDIR /source

EXPOSE 8080
RUN rustc -V

RUN cargo build --release
CMD cargo run --release
```

https://github.com/CleverCloud/demo-rust
