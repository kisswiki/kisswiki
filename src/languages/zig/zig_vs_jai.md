andrewrk

The primary difference between Zig and Jai approach to comptime is that Jai runs things directly on the host while Zig emulates the target. This means that Jai can do more powerful things, such as run an entire OpenGL game and then use the final score as an input to the compilation, while Zig has better reproducibility, cross-platform capabilities, and caching.

Jai is designed to fully rebuild a project limited to tens of thousands of lines of code with every compilation[1], in a development environment that must be set up correctly, while Zig is designed to scale up to tens of millions of lines of code or maybe more, minimally rebuilding only the parts that are changed, on any host for any target.

[1]: source: Jon’s Twitch stream from like 8 years ago

https://lobste.rs/s/nvv46t/using_jai_s_unique_powerful_compiler_for#c_n5qewt
