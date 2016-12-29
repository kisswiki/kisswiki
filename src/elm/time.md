- http://elm-lang.org/examples/time

## Current time

```elm
type Msg
    = GetTime
    | NewTime Time
-- in update
Task.perform NewTime Time.now
```

- https://github.com/rofrol/elm-date-playground
- http://package.elm-lang.org/packages/elm-lang/core/latest/Task#perform
