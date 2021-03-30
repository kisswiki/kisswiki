I have been using Zig in earnest for about 8 months now. At that time my default choice for new projects was Rust, so I picked up the biggest Rust project I had ([comrak](https://github.com/kivikakk/comrak), perhaps the 2nd most popular CommonMark/GFM formatter in the ecosystem) and [converted it to Zig](https://github.com/kivikakk/koino). It was quite refreshing.

Since then I’ve built a number of tools with Zig, and I have honestly not had to deal with memory leaks, use-after-free, double-free, etc. almost ever. The general purpose allocator does what you would otherwise have to reach for Valgrind for, but better. The careful design of defer, errdefer and control flow around error handling make it quite a joy to use.

If you already grok manual memory management as a concept (say, you’ve used C quite a bit before), then Zig feels like it gives you all the tools you need to do it sanely without much overhead, like what you always wanted. A lot of people are repelled by the idea of doing it ‘manually’, but my experience is that it is the poor affordances C gives that generates that repulsion. I do recommend it.

https://lobste.rs/s/f98dpj/pin_suffering#c_2z4fal
