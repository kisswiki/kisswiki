https://elmlang.slack.com/archives/general/p1484459459014621

@mordrax:

I'm trying to run a list of cmds asynchronously so it doesn't block up the ui, if I batch them and return one batched cmd, it still blocks the ui for the duration of all the cmds combined, how do i specify I want cmds to run independently of each other in their own js execution loops?

@rtfeldman:

I'd try refactoring that to `Task.perform Sleep (Task.succeed nextCmd)` - although putting `Cmd` inside `Msg` seems like it would be less nice than just:

```elm
yield : msg -> Cmd msg
yield =
    Task.succeed >> Task.perform identity
```
