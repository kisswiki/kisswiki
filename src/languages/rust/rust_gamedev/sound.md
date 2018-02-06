## alto

- https://github.com/jpernst/alto

What is Alto? Idiomatic bindings for the OpenAL 3D sound API and most known extensions.

After discussing it with the OpenAL-Soft author, it seems there are some buggy OpenAL router DLLs that won't report a version until after you open a device. I've added a workaround for this and published a new version. Let me know if it works.

Another one of the bugs in creative's AL wrapper is that it lies about what extensions are actually supported, so in this case I assume it's claiming that EFX is supported when in fact it is not. There's not much I can do about that; people will just need to handle the failure cases rather than unwraping them. I'll adjust the example to fall back instead of crashing.

- https://www.reddit.com/r/rust_gamedev/comments/6g6k8h/announcing_alto_20_with_a_more_pleasant_api/

## rodio

Another issue I had actually has to do with one of ggez’s dependencies. rodio, created by master crate creator tomaka. Currently, it doesn’t have a way to stop any audio that is being played. There is a PR ready to be merged into implement this, and then ggez simply needs to offer a high-level interface to stop audio[^3]. This isn’t a huge deal, but it will be nice to have this functionality when it is finally implemented.

http://dale.io/blog/rustris-post-mortem.html
