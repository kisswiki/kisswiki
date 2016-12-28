- https://groups.google.com/forum/#!msg/elm-discuss/MbOeQ_xenTw/xErVC8ArEgAJ
- http://stackoverflow.com/questions/34163401/how-to-create-a-date-variable-in-elm
- https://github.com/rluiten/elm-date-extra/tree/master/examples

```elm
import Date
import Html
main = text <| Date.fromString "2015-10-05"
```

```elm
Date.fromString "2011/1/1" |> Result.withDefault (Date.fromTime 0)
```
