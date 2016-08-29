> I think it's more that the difference between list and vector performance was less marked on older CPUs, due to smaller/fewer caches i.e. the cost of hitting memory was more-or-less uniform, so data structures (linked-lists) spread around the heap were not so expensive. Now you have to be more careful to achieve good cache locality, so linked-lists really start to suck.
> CPU's aren't getting faster because Moore's law is dead. And RAM is also at the physical limit of how fast data can be transmitting. The only way it gets faster is caches, which hate linked lists.
> Haskell has no place on modern computer systems. And the future system it's waiting for isn't going to come.
> Larger caches doesn't solve the issues. See above.
> With TLB pollution which is endemic to linked lists. Even smart slab allocators have this problem. You can just can't handle million of pointers efficiently. The virtual memory translation becomes an issue.

<br>

> Haskell - which, by the way, has an unofficial motto of "Avoid success at any costs."
> http://www.akitaonrails.com/2015/10/28/personal-thoughts-on-the-current-functional-programming-bandwagon
