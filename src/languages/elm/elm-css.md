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

```bash
$ elm package install rtfeldman/elm-css
$ elm package install rtfeldman/elm-css-utils
```

```elm
module Main exposing (main)

import Css exposing (alignItems, auto, backgroundColor, borderBox, borderRadius, boxSizing, center, color, cursor, default, displayFlex, ellipsis, flexEnd, fontFamilies, fontSize, hex, hidden, justifyContent, listStyleType, margin, marginLeft, maxHeight, minHeight, minWidth, none, overflowX, overflowY, padding, padding2, paddingTop, pointer, px, rgba, textOverflow, width, zero)
import Css.Foreign exposing (body, global)
import Css.Helpers exposing (toCssIdentifier)
import Html
import Html.Styled exposing (Html, button, div, fromUnstyled, li, styled, text, toUnstyled, ul)
import Html.Styled.Attributes exposing (class, classList)


bodyStyleNode : Html msg
bodyStyleNode =
    global
        [ body
            [ backgroundColor (hex "#191e29")
            , color (hex "#b3c4cb")
            , fontFamilies [ "sans-serif" ]
            , boxSizing borderBox
            ]
        ]


type DivClasses
    = Div1Class


divStyleNode : Html msg
divStyleNode =
    Css.Foreign.global
        [ Css.Foreign.class Div1Class
            [ backgroundColor (hex "#fff")
            , color (hex "#000")
            ]
        ]


main : Html.Html msg
main =
    styled div
        []
        []
        [ bodyStyleNode
        , div [ class (toCssIdentifier Div1Class) ] [ divStyleNode, text "Hello world" ]
        ]
        |> toUnstyled
```

- https://github.com/rtfeldman/elm-css/issues/383#issuecomment-377198383

## No way to have multiple box shadows

https://github.com/rtfeldman/elm-css/issues/265

Need to use `property`:

```elm
property "box-shadow" "0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)"
```

Example from https://codepen.io/sdthornton/pen/wBZdXq

## pseudo class

`any-link` and `hover`

```elm
pseudoClassStylesheet : Stylesheet
pseudoClassStylesheet =
    (stylesheet << namespace "pseudoClasses")
        [ id Page
            [ color (hex "#fff")
            , hover
                [ marginTop (px 10)
                , focus
                    [ color (hex "#000") ]
                ]
            , first
                [ fontSize (Css.em 3) ]
            , disabled
                [ marginTop (px 20) ]
            , pseudoClass "any-link"
                [ color (hex "f00") ]
            , backgroundColor (hex "#aaa")
            ]
        ]
```

https://github.com/rtfeldman/elm-css/blob/14.0.0/tests/Fixtures.elm

## batch

```elm
underlineOnHover : Style
underlineOnHover =
    batch
        --~ textDecoration none
        [ color (rgb 128 127 126)
        , hover
            --[ textDecoration underline ]
            [ color (rgb 23 24 25) ]
        ]
```

https://github.com/rtfeldman/elm-css/blob/14.0.0/tests/Fixtures.elm