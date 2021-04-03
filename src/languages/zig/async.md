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

##

lithdew
—
31.03.2021
Yep :thumbsup:
Just pushed it, I use tcpkali to have a TCP server startup to take messages from example_gossip
terminal 1: tcpkali -T1h -l 9001 -d
terminal 2: zig build && gdb --ex run --args zig-cache/bin/example_gossip 9001
lithdew
—
31.03.2021
@Protty encountered it yet again
The fix was to change line 503:
const conn = try self.acquire(reactor);
to:
const conn = try await async self.acquire(reactor);
Lia
—
31.03.2021
ahhha
somewhat subtle
lithdew
—
31.03.2021
Yeah, it'll have to do until stage2 comes out hahah
Thank you for the help :pray:
Lia
—
31.03.2021
yw! :pray:
Protty
—
31.03.2021
oof its that bug again
lithdew
—
31.03.2021
have 2 call sites I'm using the trick at now lol
Protty
—
31.03.2021
see any pattern in the called functions that could trigger it?
lithdew
—
31.03.2021
it mainly happens in async fns where inside of em I do frame = async doWork()
or in async fns that call other async fns 3 or 4 levels down
so smth to do with nesting async fn calls

https://github.com/lithdew/hyperia/blob/2d72e93857a6470665339ee2e05a01426ed112b7/example_gossip.zig#L578
