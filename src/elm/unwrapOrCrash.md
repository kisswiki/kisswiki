https://elmlang.slack.com/archives/general/p1484056155012646

```elm
unwrapOrCrash : Maybe a -> a
unwrapOrCrash m =
    case m of
        Nothing ->
            Debug.crash "nothing"

        Just x ->
            x
```
