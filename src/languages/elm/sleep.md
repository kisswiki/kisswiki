- https://discourse.elm-lang.org/t/automatically-redirect-user-after-a-few-seconds/1258
  - https://ellie-app.com/64S6n6jqQa1/0

```elm
module Main exposing (main)

import Html exposing (Html, text, div, button)
import Html.Events exposing (onClick)
import Task
import Process
import Time 
type alias Model =
    { message : String }


init =
    ( { message = "nothing yet" }, Cmd.none )


main = Html.program
    { view = view
    , init = init
    , update = update
    , subscriptions = \_ -> Sub.none
    }


view model =
    div [] [ button [ onClick Login ] [ text "click me!" ]  , text model.message ] 

type Msg = Login | ShowDashboard Time.Time

update msg model =
    case msg of
        Login ->
            ( { model | message = "temporary message" }
            , Task.perform ShowDashboard (Process.sleep 2000 |> Task.andThen (\_ -> Time.now))
            )

        ShowDashboard _ ->
            ( { model | message = "" }
            , Cmd.none
            )
```