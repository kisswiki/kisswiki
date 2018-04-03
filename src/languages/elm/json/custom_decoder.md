```elm
module Main exposing (main)

import Html exposing (Html, text)
import Json.Decode exposing (..)

parseInt =
    andThen (\raw ->
        case String.toInt raw of
            Ok n -> succeed n
            Err e -> fail e
            
        ) string


main : Html msg
main =
    text <| toString <| decodeString parseInt """ "5" """
```

With `fromResult`:

```elm
module Main exposing (main)

import Html exposing (Html, text)
import Json.Decode exposing (..)

fromResult : Result String a -> Decoder a
fromResult result =
    case result of
        Ok successValue ->
            succeed successValue

        Err errorMessage ->
            fail errorMessage

parseInt =
    string |> andThen (String.toInt >> fromResult)


main : Html msg
main =
    text <| toString <| decodeString parseInt """ "5" """
    
```

- https://www.brianthicks.com/post/2017/01/13/create-custom-json-decoders-in-elm-018/
- https://stackoverflow.com/questions/40736079/how-to-convert-from-string-to-int-in-json-decoder-in-elm-core-5-0-0/49638589#49638589
- http://package.elm-lang.org/packages/elm-community/json-extra/2.7.0/Json-Decode-Extra#parseInt
- https://github.com/elm-community/json-extra/blob/2.7.0/src/Json/Decode/Extra.elm#L388
- https://github.com/elm-community/json-extra/blob/2.7.0/src/Json/Decode/Extra.elm#L368