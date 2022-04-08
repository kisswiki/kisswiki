- [André Staltz (@andrestaltz): You will learn RxJS at ng-europe 2016 - YouTube](https://www.youtube.com/watch?v=uQ1zhJHclvs)
- https://egghead.io/courses/rxjs-subjects-and-multicasting-operators
- [André Staltz: Two Fundamental Abstractions - Uphill Conf 2018 - YouTube](https://www.youtube.com/watch?v=fdol03pcvMA)
- https://v6.rxjs.dev/guide/v6/migration
  - https://medium.com/@swapnilkls29/rxjs-6-0-migration-37a6f3de0000
  - https://auth0.com/blog/whats-new-in-rxjs-6/
- https://rxjs.dev/6-to-7-change-summary

Subject is a bridgeObservable to share the execution

has addObservers metod (subscribe)

There are subject for late subscribers, subscribers that arrive late:

BehaviorSubject has initial value and replays last value

ReplaySubject replays events: buffer size (amount of events) and also time window (last n miliseconds of events)

AsyncSubject replays only last value

multicast is shortcut for creating subject

it has connect (to start execution) and unsubscribe methods

connectable is created with multicast

it has refCount method to automatically connect and disconnect - start and stop execution.

refCount prevents leaks when we forget to unsubscribe connectable.

share is publish().refCount()

publish is shortcut for multicast(new Subscriber())

publishReplay(100) is a mutlicast(new ReplaySubject(100))

publishBehavior(0) is a multicast(new BehaviorSubject(0))

publishLast is a multicast(new AsyncSubject())

subjectFactory is when multicast(() => new Subject())

subjectFactory is when subscriber subscribe after completion of last subject, new subject is created

multicast(() => new Subject(), function selector(shared) {})

## mergeMap

mergeMap is map().mergeAll()

https://egghead.io/lessons/rxjs-flatten-a-higher-order-observable-with-mergeall-in-rxjs

## defer

```
const source = Observable.defer(() => Observable.of(
  Math.floor(Math.random() * 100)
));
```

Why don't just set the source Observable to of(Math.floor(Math.random() \* 100)?

Because if we do that the expression Math.floor(Math.random() \* 100) will run right away and be available in source as a value before we subscribe to source.

We want to delay the evaluation of the expression so we wrap of in defer. Now the expression Math.floor(Math.random() \* 100) will be evaluated when source is subscribed to and not any time earlier.

https://stackoverflow.com/questions/38764578/rxjs-understanding-defer/53017413#53017413

## shareReplay

shareReplay is the multicast operator with a ReplaySubject, followed by a refCount. So I would bet that publishReplay(x).refCount() should be quite close to the shareReplay behaviour.

https://stackoverflow.com/questions/34600088/pattern-for-sharereplay1-in-rxjs5/34603009#34603009
