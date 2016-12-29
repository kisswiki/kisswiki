- http://elm-lang.org/examples/time

## Current time

```elm
type Msg
    = GetTime
    | NewTime Time
-- in update
Task.perform NewTime Time.now
```

https://github.com/rofrol/elm-date-playground
