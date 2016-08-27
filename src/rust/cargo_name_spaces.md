https://www.reddit.com/r/rust/comments/4z6fni/landgrabs_on_cratesio/

> I don't have control over the phaylon prefix, piston doesn't have control over the piston namespace, because they are not really namespaces
> Rubygems.org has existed for 13 years now, without namespaces and with a first-come-first-served policy, and the Rubygems ecosystem is doing just fine.

<br>

> When you provide a service like crates.io, you have to choose a policy. You have two options:
> 1. you can say "we run this service so we'll do as we choose with crates and who gets them"
> 2. you can say "first come, first served."
> We decided to go with \#2. \#1 leads to a lot of complexity, for all kinds of reasons. Mutable state is very tricky when you don't have a borrow checker ;)
> In the end, append-only and immutable is the architecture we chose for crates.io, both technically and socially.
