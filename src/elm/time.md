- http://elm-lang.org/examples/time

## Current time

```elm
type Msg
    = GetTime
    | NewTime Time
-- ...
Task.perform NewTime Time.now
```

https://github.com/rofrol/elm-date-playground
