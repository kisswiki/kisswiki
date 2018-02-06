```elm
module Main exposing (..)

import Html exposing (Html, text, div)
import Json.Decode exposing (Decoder, string, int, andThen, map, map2, succeed, fail, field, decodeString)


main : Html a
main =
    div []
        [ div [] [ msg1 |> decodeString decodeContent |> toString |> text ]
        , div [] [ msg2 |> decodeString decodeContent |> toString |> text ]
        , div [] [ msg3 |> decodeString decodeContent |> toString |> text ]
        ]


andMap : Decoder a -> Decoder (a -> b) -> Decoder b
andMap =
    map2 (|>)


type alias Profile =
    { email : String
    , balanceEur : Int
    , id : String
    }


type alias ContentError =
    { errorText : String
    , errorType : String
    , errorLabel : String
    }


type ProfileOrError
    = ProfileValue Profile
    | ErrorValue ContentError


decodeProfile : Decoder Profile
decodeProfile =
    succeed Profile
        |> andMap (field "email" string)
        |> andMap (field "balanceEur" int)
        |> andMap (field "id" string)


decodeContentError : Decoder ContentError
decodeContentError =
    succeed ContentError
        |> andMap (field "errorText" string)
        |> andMap (field "errorType" string)
        |> andMap (field "errorLabel" string)


decodeContent : Decoder ProfileOrError
decodeContent =
    field "tag" string
        |> andThen decodeResponseTag


decodeResponseTag : String -> Decoder ProfileOrError
decodeResponseTag tag =
    case tag of
        "OK" ->
            field "contents" (map ProfileValue decodeProfile)

        "Error" ->
            field "contents" (map ErrorValue decodeContentError)

        _ ->
            fail "invalid tag"


msg1 =
    """
{
  "tag": "Error",
  "contents": {
    "errorText": "Unable to display content. User not logged in.",
    "errorType": "Unauthorized",
    "errorLabel": "no_session_cookie"
  }
}
"""


msg2 =
    """
{
  "tag": "OK",
  "contents": {
    "email": "rofrol4@gmail.com",
    "balanceEur": 0,
    "id": "83968447-500c-11e7-8001-0242ac120004"
  }
}
"""


msg3 =
    """
{
  "tag": "blabla",
  "contents": {
    "email": "rofrol4@gmail.com",
    "balanceEur": 0,
    "id": "83968447-500c-11e7-8001-0242ac120004"
  }
}
"""
```

- https://ellie-app.com/3tjTqkXg8D2a1/4
- https://stackoverflow.com/questions/41465430/is-it-possible-to-conditionally-decode-certain-fields-using-elm-decode-pipeline
