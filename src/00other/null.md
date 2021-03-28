electrograv on Nov 11, 2018 [–]

I think the author of that blog post fundamentally misunderstands the point: The damage of nullable pointers is not that they are nullable, but that compilers allow you to write code everywhere that assumes they’re not null (in fact, this is the only possible way to code, when the language cannot express the notion of a non-nullable reference!)

For example, most older languages with “the billion dollar mistake” have no complaint whatsoever when your write “object.method();” where it’s unknown at this scope whether “object” is null or not.

The fact that such code compiles is the billion dollar mistake; not the fact that the pointer is nullable.

I don’t care if you want to write nullable references everywhere, or whatever else you prefer or your application demands. That’s fine, so long as:

1. Non-nullable reference types must exist.

2. Nullable references types must exist as statically distinct from #1.

3. The compiler must not let you write code that assumes a nullable reference is not null, unless you check via a control flow statement first.

Now to take a step back, the principle behind this certainly applies beyond just nullability (if that was the point you were trying to make): Generally, dynamic, untyped invalidation states are dangerous/bad, while statically typed invalidation states are ideal. And yes, this does include bad states internal to a non-null reference, just as much as to a null reference.

Sum types are the key to being able to statically declare what range of values a function may return (or accept), and ensure at compile time that these different cases are all accounted for. If you aren’t aware of how elegantly sum types solve this, you should look into it — and I suspect it will be quickly clear why nullable references are useless, outdated, and harmful.

But at the very least, we’ve solved the pain of null dereference — and virtually without compromise. So, it’s irresponsible or ignorant IMO to create a new language that doesn’t include this solution in its core.

gameswithgo on Nov 11, 2018 [–]

> the compiler will statically guarantee the impossibility of null dereference exceptions,

almost every language that gets rid of nulls with something like the Option type will let you still bypass it and get a null reference exception. Rust lets you unwrap, F# lets you bypass it. You could at least enforce a lint that doesn't allow the bypasses in projects where that is desired though.
electrograv on Nov 11, 2018 [–]

Yes, but there’s a big difference between the default member access operator crashing conditionally based on null-ness — vs — the same operator guaranteeing deterministic success (thanks to static type checks), with the option to circumvent those safe defaults if the programmer really wants to (in which case they usually must be very explicit about using this discouraged, unsafe behavior).

It may seem to be just semantics, but it’s really quite important that the default (and most concise) way in these languages to read optional values is to check if they’re null/None first in an if statement, after which you can call “object.method()” all you like. It’s important that you can’t just forget this check; it’s essential to using the content of the optional, unless you explicitly type something like “.unwrap()” — in which case there’s almost no chance the programmer won’t know and think about the possibility a crash. Take this in contrast to the chance of crash literally every time you type “->” or “.” in C++, for example.

- https://news.ycombinator.com/item?id=18425340

## Links

- john.freml.in/billion-dollar-mistake
- https://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare/
- https://www.reddit.com/r/programming/comments/6sfxhr/code_smells_null/
