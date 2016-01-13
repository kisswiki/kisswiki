- Decoupling
  - Reactive programming is simply about decoupling data production from data consumption https://github.com/arqex/curxor/issues/1#issuecomment-72642125
  - CSP channels go beyond and decouple 3 things: data production, data medium, data consumption https://github.com/arqex/curxor/issues/1#issuecomment-72642125
- Inversion of control
  - The common ground is that all FRP works with the concept of observability which enables reacting to change automatically https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyov7dj
  - Reactive Programming can most easily be explained as reacting to a change, instead of being told about a change https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
  - example https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
    - We have a module A that does a specific task and we decide to add a second module B that should run after module A. module A will now require module B to be able to tell it when to run.  
    `moduleB(dataFromModuleA)`  
    So the bad thing that happened here was: You had to change your existing code and it now has a side effect, calling moduleB. Your tests might also be broken because of this. With a reactive pattern we would not require module B in module A, we would do the exact opposite, require module A in module B.  
    `moduleA.on('change', function (dataFromModuleA) { // Handle data from module A });`
- CSP + transducers vs Reactive Programming/Observable
  - FRP functions used inside streams needed to understand they were in a stream. Functions used in a transducer don’t know they’re in a transducer. Basically I can reuse them with all my current map/reduce/filtering code inside async channel. https://medium.com/@puppybits/rxjs-is-great-so-why-have-i-moved-on-534c513e7af3
  - csp is a small concept that is then built on by many helper functions. (these helper functions can come in various forms, transducers being just one) RxJS, basically needs to be used as a whole large library. https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
  - They are both stream interfaces that can be treated as any other set of data https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
  - The official terminology for a stream is "Observable", for the fact that it can be observed, but I find it to be a silly name, so I call it stream https://gist.github.com/staltz/868e7e9bc2a7b8c1f754
  - They are both stream interfaces that can be treated as any other set of data https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618
  - The Observable proposal is also just one way to handle asynchronous data streams there are others e.g. async/await, CSP/channels, event emitters, streams or maybe even an actor system. https://medium.com/@BrianDiPalma/thoughts-on-rxjs-cf3562e20d74
- State
  - State is actually the dual to events. Given one, you can extract the other. An example is your age (state) and your birthdays (events). So modelling data as a stream of events makes state implicit because state is just the other side of the coin, you are not eliminating it, you are just working in a different "coordinate system" https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyojrze
- Immutability/Stream/Spreadsheet cells
  - TODO: why it's good
  - RxJS feels much like the immutable-js project by Facebook. It is a huge API that is about handling data, not about creating applications. https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
  - example (2:27 in video http://www.thedotpost.com/2015/12/andre-medeiros-the-whole-future-declared-in-a-var)

    ```javascript
    var a = 3;
    var b = 10 * a;
    console.log(b); // 30
    a = 4;
    b = 10 * a;
    console.log(b); // 40
    a = 6;
    b = 10 * a;
    console.log(b); // 60
    ```
- pragmatic definition of FRP
  - Use streams of data to create the application state (data)
  - Build a UI given only the application state with pure functions (view)
- Scan
  - Unlike an iterable, which has a known length, an observable is often open-ended, so we have to use the slightly less familiar scan operation. This is basically an incremental reduce, performing an aggregation step for each item in the observable sequence as soon as it arrives. https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540
