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
