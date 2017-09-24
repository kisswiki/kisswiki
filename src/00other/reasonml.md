> I'd also love to hear why ReasonML is good.
Not the OP but I've spent the last couple weeks diving into ReasonML [1]. I'll give you the synopsis:
1. Type system is great. Way better than Flow/TypeScript in terms of both ergonomics (my opinion) and soundness
2. Comes out of the box ready to build React apps. Project init is very easy (there's reason-scripts for create-react-app and already boilerplate/generators for React Native apps as well).
2. Writing your own bindings for JavaScript code requires some elbow grease and semi-advanced knowledge of both OCaml and BuckleScript; harder than adding flow annotations or typescript definitions IMO. But once written, it's as easy as an `npm install` for everyone else.
3. Still lots of open questions and unfinished stories - especially around async programming. The built-in promise bindings kind of suck right now. I wrote bindings for Most.js [2] that I hope alleviates some of the pain for now until they get their head on straight.
I've spoken a lot with Cheng Lou and other people working on ReasonML in the discord channel, and they're just great - very helpful and friendly to a beginner like me. The community is small but very good. Feel free to hop in and ask questions and try it out!

[1] https://reasonml.github.io/
[2] https://github.com/Lokeh/bs-most

https://news.ycombinator.com/item?id=15295501

## clojure

Right now, though, I would honestly recommend ClojureScript before Reason. I do believe the maturity of that ecosystem really has hit the point where the gains (REPL, data-driven development, reagent + reframe + figwheel >>> react + redux + webpack, and CHANNELS!) outweigh the costs (unfamiliar language, unfamiliar ecosystem, additional layer of abstraction). I've built some internal tools using Electron + CLJS and it was great. Haven't messed around with using it and React Native yet but I know that the renatal [1] project has come a long way over a short period of time.

[1] https://github.com/drapanjanas/re-natal
