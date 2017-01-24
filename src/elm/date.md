- https://groups.google.com/forum/#!msg/elm-discuss/MbOeQ_xenTw/xErVC8ArEgAJ
- http://stackoverflow.com/questions/34163401/how-to-create-a-date-variable-in-elm
- https://github.com/rluiten/elm-date-extra/tree/master/examples
- https://github.com/mgold/elm-date-format
- https://github.com/alpacaaa/elm-date-distance
- json decode https://www.brianthicks.com/post/2017/01/13/create-custom-json-decoders-in-elm-018/

```elm
import Date
import Html
main = text <| Date.fromString "2015-10-05"
```

```elm
Date.fromString "2011/1/1" |> Result.withDefault (Date.fromTime 0)
```

## Decoder and Date

>If you're using a third-party JS custom element (e.g. <google-maps/>) and it fires custom events which contain dates, there is no way to decode those events using on and a decoder.
>
>-- https://groups.google.com/forum/#!msg/elm-dev/SrXIgHft3mM/BkFXIuVCBgAJ
