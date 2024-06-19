@Linguistic-mystic

- C has macros which greatly help keep code smooth. Zig has only comptime which does not help with boilerplate reduction the way macros do. For example, people have implemented generics and interfaces using macros, which Zig just can’t do;

- C has a proto-exceptions system with setjmp/longjmp, Zig has nothing similar. For example, in C I can throw an exception on a null pointer, handle it, and my program will move on. In Zig it will be a “panic” and there’s no way to recover from it;

- C is stable and mature, battle-tested even, while Zig has breaking changes every several months with no end in sight. When’s it going to reach a status of “battle-tested”? Years if not decades.

@Disastrous_Floor_972

- "Smooth" is a very subjective word, so I can only guess what you mean by this, but I have only ever heard from senior C developers that macros make code hard to read and reason about. Sure, Zig does not have the copy-paste functionality of macros, but in return you literally get the entire language available at compile time including compiler features and type checking. That's a great deal in my opinion. I don't think you've thought very hard about the boilerplate argument. You brought up generics, so writing ArrayList([]const u8) is surely boilerplate reduction from rewriting the entire struct, no?

- if (p == null) return error.NullPointer. I don't really know what your complaint is here. As a matter of fact I'm starting to think you've never used the language.

- The "end in sight" is updated yearly in roadmap presentations. You can see the release milestones on GitHub and read about the support tiers in the release notes. You are correct, Zig is not yet stable, mature, or battle-tested, but I'd say its on a good path to be all of those things when 1.0 rolls around.

https://www.reddit.com/r/Zig/comments/1ddn59m/comment/l88p2ej/
