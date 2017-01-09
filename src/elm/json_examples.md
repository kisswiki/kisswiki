## Decode field to int event if it's string in json

```elm
Decode.map Model
    ("id" := Decode.string |> stringToInt )
```

http://stackoverflow.com/questions/32575003/elm-how-to-decode-data-from-json-api

## optional with pipeline

```
type alias User =
    { age : Maybe Int
    }

user : Decoder User
user =
    decode User
        |> optional "age" (map Just int) Nothing
```

- from dailydrip email
- http://package.elm-lang.org/packages/NoRedInk/elm-decode-pipeline/latest

## mutually recursive decoders

```elm
type Question
    = Question Int (Maybe Answer)


type Answer
    = Answer Int (Maybe Question)


test =
    """{"value":4,"nested":{"value":3,"nested":null}}"""


andMap : Decoder a -> Decoder (a -> b) -> Decoder b
andMap =
    flip (Decode.map2 (<|))


question : Decoder Question
question =
    Decode.succeed Question
        |> andMap (field "value" int)
        |> andMap (field "nested" (nullable (lazy (\_ -> answer))))


answer : Decoder Answer
answer =
    Decode.succeed Answer
        |> andMap (field "value" int)
        |> andMap (field "nested" (nullable (lazy (\_ -> question))))
```

from https://elmlang.slack.com/archives/general/p1483975350012245
