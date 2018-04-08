```elm
module Main exposing (..)

import Html exposing (audio, button, div)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Decode
import Json.Encode


type alias Model =
    { currentTime : Float
    , seekTo : Float
    }


init =
    ( { currentTime = 0, seekTo = 0 }, Cmd.none )


type Msg
    = Seek Float
    | TimeUpdate Float


update msg model =
    case msg of
        Seek offset ->
            ( { model | seekTo = model.currentTime + offset }
            , Cmd.none
            )

        TimeUpdate newTime ->
            ( { model | currentTime = newTime }, Cmd.none )


view model =
    div []
        [ audio
            [ src "https://ia802300.us.archive.org/8/items/gettysburg_johng_librivox/gettysburg_address_64kb.mp3"
            , controls True
            , on "timeupdate"
                (Decode.map TimeUpdate <|
                    Decode.at [ "target", "currentTime" ] Decode.float
                )
            , property "currentTime" <| Json.Encode.float model.seekTo
            ]
            []
        , div []
            [ button [ onClick <| Seek 15 ] [ Html.text "+15 seconds" ]
            , button [ onClick <| Seek -15 ] [ Html.text "-15 seconds" ]
            , button [ onClick <| Seek -999999 ] [ Html.text "Start" ]
            , button [ onClick <| Seek 999999 ] [ Html.text "End" ]
            ]
        ]


main =
    Html.program { init = init, view = view, update = update, subscriptions = always Sub.none }
```

https://discourse.elm-lang.org/t/virtualdom-property-setting-question/1089/11?u=rofrol