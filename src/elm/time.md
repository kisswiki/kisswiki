- http://elm-lang.org/examples/time
- simple example I've created https://ellie-app.com/39kwkcNPF49a1/0
- http://stackoverflow.com/questions/40599512/how-to-achieve-behavior-of-settimeout-in-elm

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
- http://stackoverflow.com/questions/38021777/how-do-i-get-the-current-time-in-elm-0-17-0-18/41383057#41383057
