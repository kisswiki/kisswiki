
## list

Lists share tails not heads. If you append to a list, you have to copy the entire list, if you prepend (so go from [1 2 3 4] to [0 1 2 3 4]) you're just creating a cell with 0 and a reference to the old list.

Yes, there's always some marginal benefit to being immutable even in a most trivial case, as long as we ignore performance hit, resource usage and other costs. But we can't ignore them at some point.

Well, there's a range of solutions out there, and we should use all in balance. For example I'm especially keen lately of "single owner" semantics (aka linear types, or "movable" references). They also solve the problem of global mutable state, not by making state immutable, but making it nonglobal.

At the very least, the immutability abstraction becomes leaky, as we're managing things (memory, disk space, CPU) for which there's no concept of in the functional programming space. For example the word I used just now: "delete". If you could truly delete it it's mutable. So you need to carefully ensure you "can't see it" anymore, so it can be garbage collected.

https://www.reddit.com/r/programming/comments/6xee86/immutability_the_way_to_remain_unchanged/
