##

- the faq entry about assertions boldly betrays a fundamental lack of understanding about control flow and data invariants
- defer is function-scoped and heap allocates
- the double return value system is undisciplined, clunky, and buggy, you can easily miss an error when refactoring
- lack of basic type safety for example with enums
- channels are an awful, buggy concurrency primitive, especially with the way they implemented them
- making zero meaningful hides bugs for example by making all pointers optional

that was just 30 seconds off the top of my head.

go is great if you are an amateur with no taste, like 99% of google employees.

https://lobste.rs/s/eld5cs/go_is_well_designed_language_actually#c_ezn9ql

##

There was a point 3 years ago when I was also drawn towards go, but the amount of abstractions and the drastic distance from any hardware given concepts really repelled me. Now I’m of the opinion that you can’t hide the(complex..) ugly reality by abstracting everything away from the user if you engage in any kind of lowlevel activity. Instead embracing it with proper “rules” or opinions and concepts explicitly as zig does is the way

https://www.reddit.com/r/Zig/comments/vu6u39/comment/ifcfjxc/
