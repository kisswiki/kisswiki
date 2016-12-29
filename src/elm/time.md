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
- https://becoming-functional.com/tasks-in-elm-0-18-2b64a35fd82e
