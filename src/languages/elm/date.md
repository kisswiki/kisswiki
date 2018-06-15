- https://groups.google.com/forum/#!msg/elm-discuss/MbOeQ_xenTw/xErVC8ArEgAJ
- http://stackoverflow.com/questions/34163401/how-to-create-a-date-variable-in-elm
- https://github.com/rluiten/elm-date-extra/tree/master/examples
- https://github.com/mgold/elm-date-format
- https://github.com/alpacaaa/elm-date-distance
- json decode
  - https://www.brianthicks.com/post/2017/01/13/create-custom-json-decoders-in-elm-018/
  - http://stackoverflow.com/questions/37146233/elm-json-decoder-timestamp-to-date

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

## Format date

http://package.elm-lang.org/packages/mgold/elm-date-format/1.6.0/Date-Format

```elm
import Date.Format
"2015-10-05" |> Date.fromString |> Date.Format.format %d %B %Y"
```

Cons: No ordinals like 2nd June

I could use http://package.elm-lang.org/packages/rluiten/elm-date-extra/9.3.1, but it supports ordinal numbers only for English.

Or http://package.elm-lang.org/packages/ryannhg/elm-date-format/2.1.1 only with English support.

Additionally there is

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString