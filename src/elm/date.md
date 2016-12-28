- https://groups.google.com/forum/#!msg/elm-discuss/MbOeQ_xenTw/xErVC8ArEgAJ

```elm
import Date
import Html
main = text <| Date.fromString "2015-10-05"
```

```elm
Date.fromString "2011/1/1" |> Result.withDefault (Date.fromTime 0)
```
