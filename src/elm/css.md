- State of CSS in Elm https://groups.google.com/forum/#!topic/elm-discuss/AC6cqdeKDOs
- learn https://flukeout.github.io/
- https://github.com/rtfeldman/elm-css
  - define custome property in elm-css http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property

- https://github.com/rtfeldman/elm-css-helpers

## css-elm

### Example

sabine:

```elm
styles =
    Css.asPairs >> Html.Attributes.style

button [ styles [ position absolute, left (px 5) ] ]
    [ text "Whee!" ]
```

https://elmlang.slack.com/archives/general/p1484139837013133

## hover

https://elmlang.slack.com/archives/general/p1484185181013557

montanonic: what is the Elm solution to something like on-hover effects? Should we stick to CSS hover or handle that animation within the update loop?

rtfeldman: personally I just use CSS if I can; it's generally the highest-performance way to do it, and I haven't really found any maintainability downsides

## External CSS

- https://github.com/tomekwi/elm-live
- https://github.com/elm-lang/elm-reactor/issues/138#issuecomment-240940888
