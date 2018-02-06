```elm
List.filterMap
    (\( color, message, cond ) ->
        if cond model then
            Just (toDiv color message)
        else
            Nothing
    )
    messages
```

same as

```elm
List.concatMap
    (\( color, message, cond ) ->
        if cond model then
            [ toDiv color message ]
        else
            []
    )
    messages
```
