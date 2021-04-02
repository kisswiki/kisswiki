- https://lists.sr.ht/~andrewrk/ziglang/%3COS0P286MB04522254551E16B4EC7C9585B1B49%40OS0P286MB0452.JPNP286.PROD.OUTLOOK.COM%3E
  - code https://ingchips.github.io/blog/2021-01-25-zig-async/

fengb

And there’s probably no work done on async for awhile since all hands are on stage2

- [Proposal: a way to check async frame liveness · Issue #3164 · ziglang/zig](https://github.com/ziglang/zig/issues/3164)
- [Proposal: Event loop redesign · Issue #8224 · ziglang/zig](https://github.com/ziglang/zig/issues/8224)
- [Evented I/O introduces multithreading into the control plane, not only the data plane · Issue #5962 · ziglang/zig](https://github.com/ziglang/zig/issues/5962)

## Example

battlefranky

I'm still wrapping my mind around the async stuff, but is there anything out there that's a good real example on how to use it?

g_w1

this app is async https://github.com/kristoff-it/bork
