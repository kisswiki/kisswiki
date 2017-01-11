- State of CSS in Elm https://groups.google.com/forum/#!topic/elm-discuss/AC6cqdeKDOs
- learn https://flukeout.github.io/
- https://github.com/rtfeldman/elm-css
  - define custome property in elm-css http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property

- https://github.com/rtfeldman/elm-css-helpers

## Example

sabine:

```elm
styles =
    Css.asPairs >> Html.Attributes.style

button [ styles [ position absolute, left (px 5) ] ]
    [ text "Whee!" ]
```

https://elmlang.slack.com/archives/general/p1484139837013133

## External CSS

- https://github.com/tomekwi/elm-live
- https://github.com/elm-lang/elm-reactor/issues/138#issuecomment-240940888
