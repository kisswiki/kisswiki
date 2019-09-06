Window moved to Vieport https://github.com/elm/browser/blob/9f52d88b424dd12cab391195d5b090dd4639c3b0/src/Browser/Dom.elm#L129

## Old

`$ elm package install elm-lang/window`

```elm
module Main exposing (main)

import Html exposing (..)
import Task
import Window


view : Model -> Html msg
view model =
    div [] [ text <| toString model ]


type alias Model =
    { size : ( Int, Int )
    }


model : Model
model =
    Model ( 0, 0 )


type Msg
    = WindowResize ( Int, Int )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowResize size ->
            ( { model | size = size }, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , init = ( model, initialSizeCmd )
        }


initialSizeCmd : Cmd Msg
initialSizeCmd =
    Task.perform sizeToMsg Window.size


sizeToMsg : Window.Size -> Msg
sizeToMsg size =
    WindowResize ( size.width, size.height )

```

- https://ellie-app.com/jVp9wDNWBa1/0
- https://www.reddit.com/r/elm/comments/4jfo32/getting_the_initial_window_dimensions/d369kw1/
- https://github.com/elm-lang/window/blob/master/src/Window.elm
- old https://github.com/lucamug/elm-scroll-resize-events
