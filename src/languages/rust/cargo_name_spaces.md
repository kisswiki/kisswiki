https://www.reddit.com/r/rust/comments/4z6fni/landgrabs_on_cratesio/

> I don't have control over the phaylon prefix, piston doesn't have control over the piston namespace, because they are not really namespaces

<br>

> Rubygems.org has existed for 13 years now, without namespaces and with a first-come-first-served policy, and the Rubygems ecosystem is doing just fine.

<br>

> A more charitable interpretation of crates without code is that people had the intention of creating a library but they haven't gotten it to a state in which they're comfortable releasing it yet. Perhaps life got in the way, or the problem was harder than they thought.
> Should these people have their crate names taken away? I am of the opinion that no, they should not. If we agree on that point, then you'd have to be able to distinguish between a well-intentioned reservation of a name and a malicious "landgrab" of a name, and in general the core team has decided to not spend time on monitoring this and making those judgment calls, so that they can work on Rust instead.
> I'm sure if there was an egregious, obviously malicious attempt to grab infinite names, or, say, an attempt to harass someone through creating crates or otherwise use names against Rust's code of conduct, you could report it to the core team or moderation team and they would handle it on a case-by-case basis.

<br>

> When you provide a service like crates.io, you have to choose a policy. You have two options:
> 1. you can say "we run this service so we'll do as we choose with crates and who gets them"
> 2. you can say "first come, first served."
> We decided to go with \#2. \#1 leads to a lot of complexity, for all kinds of reasons. Mutable state is very tricky when you don't have a borrow checker ;)
> In the end, append-only and immutable is the architecture we chose for crates.io, both technically and socially.
