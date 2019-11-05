- Problem with current elm compiler and elm-ui https://github.com/elm/compiler/pull/1850
- ["Building a Toolkit for Design" by Matthew Griffith - YouTube](https://www.youtube.com/watch?v=Ie-gqwSHQr0)
- https://mdgriffith.gitbooks.io/style-elements
- [elm-ui - rock paper scissors (lizard spock) - YouTube](https://www.youtube.com/watch?v=fhMLEOr8C4U)
- https://dev.to/stevensonmt/-working-with-menus-in-elm-ui-292b
- https://discourse.elm-lang.org/t/learning-elm-elm-ui
- https://korban.net/posts/elm/2019-11-17-elm-ui-introduction/
  - https://github.com/Chefclub/elm-ui-tutorial

## Examples

- https://github.com/kenhkan/mbta
- An experimental library for easier UI elements creation. Not for production use. https://github.com/QiTASC/hatchinq

### Minimal example

Based on https://github.com/kenhkan/mbta

```elm
module Main exposing (main)

import Browser
import Browser.Navigation
import Element
import Url


type alias Flags =
    {}


type alias Model =
    ()


initialModel : Model
initialModel =
    ()


type Msg
    = NoOp


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view _ =
    { title = "MBTA"
    , body =
        [ Element.layout
            []
            (Element.text "Hello World!")
        ]
    }


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ _ _ =
    ( initialModel, Cmd.none )


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = \_ -> NoOp
        , onUrlRequest = \_ -> NoOp
        }
```

## UI explorer like Storybook

- in Elm-0.18 http://package.elm-lang.org/packages/kalutheo/elm-ui-explorer/latest
  - https://www.reddit.com/r/elm/comments/7867xh/elm_ui_explorer_react_storybook_like_ui_explorer/

## Form

- https://github.com/mdgriffith/elm-ui/blob/master/examples/Form.elm
- https://discourse.elm-lang.org/t/learning-elm-elm-ui/2282
  - https://github.com/Hasimir0/myElmGuide/blob/master/form.elm
- https://discourse.elm-lang.org/t/input-select-not-available-in-elm-ui/2874/5

##

<pre>
sios [8:21 PM]
Quick question because I can’t find it in the docs, how do I do a `title="Some tooltip"`?
mgriffith [8:23 PM]
@sios `Element.htmlAttribute (Html.Attributes.title "some tooltip")` for now
</pre>

##

<pre>
Sophie   [Yesterday at 10:24 PM]
Is there a way to specify `em` values in `elm-ui`?
1 reply
jhbrown   [12 hours ago]
There is not.  Just px and percents.
</pre>

## Multiple focus

[Multiple elements simultaneously render with Element.focused attributes · Issue #47 · mdgriffith/elm-ui](https://github.com/mdgriffith/elm-ui/issues/47#issuecomment-501270001)

https://jsfiddle.net/rofrol/zasq3r4p/8/

## Element.focused

```elm
Element.focused [ Element.Border.glow (Element.rgb 1 0 0) 2 ]
```

## colorToRgbaString

```elm
colorToRgbaString color =
    let
        floatTo256 f =
            if f >= 1 then
                255

            else
                floor (f * 256)

        rgba =
            Element.toRgb color

        floatToString f =
            String.pad 2 '0' (String.fromInt (floatTo256 f))
    in
    "rgba("
        ++ floatToString rgba.red
        ++ ", "
        ++ floatToString rgba.green
        ++ ", "
        ++ floatToString rgba.blue
        ++ ", "
        ++ floatToString rgba.alpha
        ++ ")"
```

https://stackoverflow.com/questions/1914115/converting-color-value-from-float-0-1-to-byte-0-255/1914172#1914172

## How to center wrapped flexbox - you can't

https://stackoverflow.com/questions/32802202/how-to-center-a-flex-container-but-left-align-flex-items/32811002#32811002

## problem with wrappedRow

https://github.com/mdgriffith/elm-ui/issues/57

## Element.Events.on, targetValue, targetChecked, keyCode are hidden in documentation

https://github.com/mdgriffith/elm-ui/blob/1.1.5/src/Element/Events.elm#L177

## Break long text without spaces

```
row [ width fill ]
  [ paragraph
    [ Font.color model.style.color
    , Font.size 40
	, Html.Attributes.style "word-break" "break-all" |> htmlAttribute
    ]
    [ text model.status.filename ]
  ]
```

- https://stackoverflow.com/questions/36150458/flex-item-overflows-container-due-to-long-word-even-after-using-word-wrap/36150638#36150638

`'overflow-wrap: break-word'` will not work when `paragraph` inside `row` so this solution https://stackoverflow.com/questions/3058866/how-to-force-a-line-break-in-a-long-word-in-a-div/3059128#3059128 is bad for flexbox.

## centralize Input.text contents

mthiems 2:33 AM
@VPagani I've seen this before, and I think this may be a bug in the current version of elm-ui. It seems the `input` DOM element needs a `text-align: inherit` style, as the `text-align: center` is on a parent `div` instead of on the `input` itself. Here's an Ellie illustrating one option for a workaround that makes it work:
https://ellie-app.com/6GQLrcSt7hWa1

https://elmlang.slack.com #elm-ui
