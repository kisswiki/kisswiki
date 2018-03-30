- https://github.com/rtfeldman/elm-css/wiki/Long-Term-Goals

## performance

- planned performance optimizations https://discourse.elm-lang.org/t/how-to-do-css-in-elm/830/17

to restore performance using elm-css with this use case is to use global styles (using Css.Foreign), 

it seems that elm-body/elegant won’t have a straightforward way to migrate to 0.19 that maintains its performance, until a way to use insertRule is added to elm core

https://discourse.elm-lang.org/t/how-to-do-css-in-elm/830/27

Well, I think elegant can send styles to JS via a port and then apply them with insertRule there instead of using the native code.

## separate style

It’s all done at runtime in plain Elm now - there are no separate stylesheets anymore (or Native for that matter). https://discourse.elm-lang.org/t/how-to-do-css-in-elm/830/7
## global style

`$ elm package install rtfeldman/elm-css`

```elm
module Main exposing (main)

import Css exposing (backgroundColor, color, hex)
import Css.Foreign exposing (body, global)
import Html
import Html.Styled exposing (Attribute, Html, div, styled, text, toUnstyled)


bodyStyleNode : Html msg
bodyStyleNode =
    global
        [ body
            [ backgroundColor (hex "#191e29")
            , color (hex "#b3c4cb")
            ]
        ]


main : Html.Html msg
main =
    styled div
        []
        []
        [ bodyStyleNode
        , div []
            [ text "Some info." ]
        ]
        |> toUnstyled
```

- https://github.com/rtfeldman/elm-css/issues/383#issuecomment-377198383