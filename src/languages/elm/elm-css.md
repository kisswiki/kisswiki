## global style

`$ elm package install rtfeldman/elm-css`

```elm
module Main exposing (main)

import Css exposing (backgroundColor, color, hex)
import Css.Foreign exposing (body, global)
import Html as Html
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