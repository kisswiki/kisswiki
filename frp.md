Decoupling
- Reactive programming is simply about decoupling data production from data consumption
- CSP channels go beyond and decouple 3 things: data production, data medium, data consumption


FRP is functional programming with



pragmatic definition of FRP
  - Use streams of data to create the application state (data)
  - Build a UI given only the application state with pure functions (view)

The official terminology for a stream is "Observable", for the fact that it can be observed, but I find it to be a silly name, so I call it stream https://gist.github.com/staltz/868e7e9bc2a7b8c1f754

Unlike an iterable, which has a known length, an observable is often open-ended, so we have to use the slightly less familiar scan operation. This is basically an incremental reduce, performing an aggregation step for each item in the observable sequence as soon as it arrives. https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540

https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
  - RxJS feels much like the immutable-js project by Facebook. It is a huge API that is about handling data, not about creating applications.
  - when developers think Functional Reactive Programming they think Observables and being able to use functional concepts like Map, Reduce, Filter etc. on them
  - Reactive Programming can most easily be explained as reacting to a change, instead of being told about a change

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
