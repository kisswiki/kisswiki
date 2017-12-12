- flatMap
  - https://egghead.io/lessons/rxjs-rxjs-map-vs-flatmap
  - http://reactivex.io/documentation/operators/flatmap.html
- flatMapLatest
  - Expand RxJS and search for flatMapLatest http://reactivex.io/documentation/operators/flatmap.html
  - https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/operators/flatmaplatest.md

## pros and cons

reactive programming is great for certain things! But it comes at a cost; the abstraction makes certain problems harder and introduces it's own set of bugs (lifecycle bugs/crashes and memory leaks being the biggest one I've encountered with RxJS & RxJava), and can make your app code harder to reason about. Is it better than using callbacks or promises and imperative programming? Probably! Is it always? Nope! Are there other alternatives? Yes (CHANNELS!)

- https://news.ycombinator.com/item?id=15296097
