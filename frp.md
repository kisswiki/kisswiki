- Decoupling https://github.com/arqex/curxor/issues/1#issuecomment-72642125
  - Reactive programming is simply about decoupling data production from data consumption
  - CSP channels go beyond and decouple 3 things: data production, data medium, data consumption
- Inversion of control
  - The common ground is that all FRP works with the concept of observability which enables reacting to change automatically https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyov7dj
  - Reactive Programming can most easily be explained as reacting to a change, instead of being told about a change https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
  - example https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
    - We have a module A that does a specific task and we decide to add a second module B that should run after module A. module A will now require module B to be able to tell it when to run.  
    `moduleB(dataFromModuleA)`  
    So the bad thing that happened here was: You had to change your existing code and it now has a side effect, calling moduleB. Your tests might also be broken because of this. With a reactive pattern we would not require module B in module A, we would do the exact opposite, require module A in module B.  
    `moduleA.on('change', function (dataFromModuleA) { // Handle data from module A });`
- CSP + transducers vs reactive programming
  - FRP functions used inside streams needed to understand they were in a stream. Functions used in a transducer don’t know they’re in a transducer. Basically I can reuse them with all my current map/reduce/filtering code inside async channel. https://medium.com/@puppybits/rxjs-is-great-so-why-have-i-moved-on-534c513e7af3
  - csp is a small concept that is then built on by many helper functions. (these helper functions can come in various forms, transducers being just one) RxJS, basically needs to be used as a whole large library. https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
  - They are both stream interfaces that can be treated as any other set of data https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
- State
  - State is actually the dual to events. Given one, you can extract the other. An example is your age (state) and your birthdays (events). So modelling data as a stream of events makes state implicit because state is just the other side of the coin, you are not eliminating it, you are just working in a different "coordinate system" https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyojrze
- Immutability
  - TODO: why it's good
  - RxJS feels much like the immutable-js project by Facebook. It is a huge API that is about handling data, not about creating applications. https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
- pragmatic definition of FRP
  - Use streams of data to create the application state (data)
  - Build a UI given only the application state with pure functions (view)
- Observable
  - The official terminology for a stream is "Observable", for the fact that it can be observed, but I find it to be a silly name, so I call it stream https://gist.github.com/staltz/868e7e9bc2a7b8c1f754
  - They are both stream interfaces that can be treated as any other set of data https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
- Scan
- Unlike an iterable, which has a known length, an observable is often open-ended, so we have to use the slightly less familiar scan operation. This is basically an incremental reduce, performing an aggregation step for each item in the observable sequence as soon as it arrives. https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540

Before we launched React we had a big discussion as whether we should change the name or not. React is completely different from everything that's called "reactive programming" and we were afraid to cause confusion. https://news.ycombinator.com/item?id=7965194

## Elm, Cycle, React, Flux, Redux

Elm and Cycle are similar, but still have important facts:
- Elm has only first-order Signals, Cycle which uses RxJS supports higher-order Observables (meaning: Observable of Observables).
- Elm ports and Cycle drivers are essentially the same concept.
- Elm Arch utilizes Signals at the extremes (for input and for output), but not that much in between. Cycle.js uses Signals/Observables at the extremes but also in between, extensively.
- Elm follows the React way when it comes to event handlers: they are specified and attached to the virtual DOM element. In Cycle.js, the virtual DOM elements we create in the app never have event handlers attached to them. This gives a clear separation of what exits the system (HTML without event handlers) and what enters the system (events through an event delegation system). In Elm and React, what exits the system is a data structure that has callbacks to return to the system.

To compliment some points you mentioned: indeed React is only "reactive" with regard to rendering. Render happens when state or props changes. Other parts are not reactive. In Redux and Flux, the Store however is "observable" by components. And the Dispatcher is observable by the Store.

React is in fact clearly multiparadigm: it uses OOP as a the main building block (for components), uses reactive pattern for its advertised "one-way data flow" from state to rendering, uses functional pattern with regard to "UI as a pure function of state". It is not properly seeking to be functional because it does not make effects explicit and push effects to the boundary of the application. They may be spread out in the application and there is no prescribed interface for effects. (Both Elm and Cycle have prescribed interfaces for effects: ports/drivers. Elm is strict about purity, Cycle cannot be because it is JavaScript, so purity is a matter of discipline). Conclusion: I disagree with your claim that React is plain FP. It's not.

Discussion point: why are we not aiming to using a true FRP approach?
Beats me. React's multiparadigm confusion plus its almost unanimous praise really intrigues me.

https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyoj29a
