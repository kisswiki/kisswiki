https://elmlang.slack.com/archives/random/p1484431928002139

@megapctr:

```elm
matchId : id -> { a | id : id } -> Bool
matchId id =
    .id >> (==) id
```
