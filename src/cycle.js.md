- examples
  - https://github.com/Widdershin/cycle-music-sequencer
   - [minimal](https://medium.com/@fkrautwald/we-are-not-writing-much-code-5404fb7d39e)

    ```javascript
    Cycle.run(
      (sources) => ({DOM: Rx.Observable.timer(0, 1000).map(i => CycleDOM.h(`div`, `Seconds elapsed: ${i}`))}),
      {DOM: CycleDOM.makeDOMDriver(`#app`)}
    )
    ```
  - http://widdersh.in/built-with-cycle/
- awesome list
  - https://github.com/Widdershin/cycle-ecosystem
- community
  - [chat](https://gitter.im/cyclejs/cycle-core)
  - https://twitter.com/search?q=cycle.js
  - http://stackoverflow.com/questions/tagged/cyclejs?sort=votes
  - blogs
    - https://medium.com/@andrestaltz
    - https://medium.com/@fkrautwald
- [canvas performance](https://gitter.im/cyclejs/cycle-core?at=5681a7610199d70069dffd60)
 - pros/cons
   - pros
    - Cycle.js is a paradigm changer, because it is the only framework in which you can extract explicit data flow graphs from the code base. When introducing new developers to large code bases, this can make them reason about the code without looking at code. [link](https://medium.com/@fkrautwald/we-are-not-writing-much-code-5404fb7d39e)
- components
 - https://github.com/mmai/cyclejs-sparklines
- http://staltz.com/unidirectional-user-interface-architectures.html
- pros/cons
  - cons
     - Cycle makes no apologies about sacrificing ease of use for proper FRP. That's fine. It will continue to be confusing to most developers. You can't even reuse components without writing a custom isolate function. https://www.reddit.com/r/javascript/comments/3xugbp/why_i_chose_to_use_cyclejs/cyafp29
- isolate
  - http://stackoverflow.com/questions/34541050/components-isolate-function-and-referential-transparency
  - https://github.com/cyclejs/isolate/blob/master/src/index.js
- vs
  - yolk.js
    - https://github.com/garbles/yolk/issues/4
  - react.js
    - http://staltz.com/why-react-redux-is-an-inferior-paradigm.html
- router
  - https://github.com/bcoop713/routerx
- http://blog.edanschwartz.com/2015/09/18/dead-simple-rxjs-todo-list/
- Intro to Functional Reactive Programming with Cycle.js - YouTube https://www.reddit.com/comments/3da3e2
- https://medium.com/@fkrautwald/plug-and-play-all-your-observable-streams-with-cycle-js-e543fc287872
- learn
  - video
    - https://egghead.io/series/cycle-js-fundamentals
      - http://codepen.io/rofrol/pen/OMwdEX?editors=0010
- speed
  - https://github.com/TylorS/cycle-snabbdom
  - Observable benchmarks https://gist.github.com/TylorS/55573b29df19c064c6b1
- visualize
  - https://glebbahmutov.com/draw-cycle/
- hot-reload
  - https://github.com/widdershin/cycle-hot-reloading-example/
- https://github.com/staltz/combineLatestObj
- starer kit
  - https://github.com/edge/cyc/tree/master/skel
- eslint https://github.com/cyclejs/eslint-config-cycle https://github.com/killercup/cycle-webpack-starter/blob/master/.eslintrc
- [ ] http://staltz.com/adapting-controlled-and-uncontrolled-fields.html

## Starterkit, boilerplate

- https://github.com/killercup/cycle-webpack-starter

## library template

https://github.com/TylorS/khaos-ts-library
