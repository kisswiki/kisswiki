`http.post` returns `Observable<Object>` so to return `Observable<void>` I need to `map(() => undefined` or shorter `mapTo(undefined)`.

- https://stackoverflow.com/questions/69137580/returning-rxjs-function-of-type-observablevoid/69138804#69138804
- https://stackoverflow.com/questions/46378457/observablevoid-usage-pattern-in-typescript/46388045#46388045
- https://www.reddit.com/r/Angular2/comments/tpvub7/what_is_a_clean_way_to_return_an_an_empty/
