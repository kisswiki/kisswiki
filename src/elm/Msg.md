## Sending message manually

```elm
Task.perform (\_ -> SomeAction) (Task.succeed Nothing)
```
