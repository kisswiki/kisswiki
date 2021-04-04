https://github.com/Hejsil/zig-gc

mattnite
—
30.03.2021
@gracefu are you knowledgeable of gc's and how jemalloc works? Just wondering if there would be a difference because jemalloc seems to try it's best to work well for webservers
But I dont know anything about gc's
jph
—
30.03.2021
jemalloc is optimized for multiplte threads with parallel access and several other criteria. The metrics are roughly sketched in the allocator talk on zig showtime https://www.youtube.com/watch?v=vHWiDx_l4V0. For anything more specific, you need to read the source code.
jph
—
30.03.2021
A garbagage collector is basically a track graph of references a supervision part for memory of the runtime. When specific stuff happens in the runtime or at some point the runtime decides, the runtime runs the cleanup program that checks all references heuristically or deterministically etc.
jph
—
30.03.2021
Mimalloc claims roughly equal performance to jemalloc and has significantly less LOC. Do you have a good comparison between both or why people use jemalloc instead of mimalloc?
mattnite
—
30.03.2021
I dont know anything about mimalloc yet
If its simpler and roughly the same perf then its sounds like a good candidate for a zig port
xq.zig @ UTC+1
—
30.03.2021
general purpose allocator for release modes?
mattnite
—
30.03.2021
Maybe async release
I dunno
Vesim
—
30.03.2021
tbh, from my experience when people start complaining about memory allocator performance it means that they have issue in their code not in the allcator performance
like memory allocations in hot path
jph
—
30.03.2021
Overall yes, except on multithreading, async and alike primitives: https://www.linkedin.com/pulse/testing-alternative-c-memory-allocators-pt-2-musl-mystery-gomes or https://andygrove.io/2020/05/why-musl-extremely-slow/.
