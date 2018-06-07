## Decode field to int event if it's string in json

```elm
Decode.map Model
    (field "id" Decode.string |> stringToInt )
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


## map Nothing

Json.Decode.succeed can be used to wrap a constant value in a decoder:

```elm
type alias Header =
    { value : String
    , term : Maybe String
    }

map2 Header (field "header" string)
    (succeed Nothing)
```

http://stackoverflow.com/questions/41623843/how-to-map-nothing-to-elm-json-decoder

## deeply nested

```elm
redditJsonResponseDecoder : Decoder (List PostContent)
redditJsonResponseDecoder =
    at [ "data", "children" ] <|
        list <|
            at [ "data" ] <|
                object2
                    PostContent
                    ("title" := string)
                    ("permalink" := string)
```

https://www.reddit.com/r/elm/comments/5o5p63/experiences_with_elm_on_a_small_production/

## create a Decoder which only matches a specific string value, and fails with all others

```elm
import Json.Decode.Decoder as Decode exposing (Decoder)

onlyMatchesHello : Decoder ()
onlyMatchesHello =
    let
        checkHello value =
            if value == "hello" then
                Decode.succeed ()
            else
                Decode.fail "Expected \"hello\""
    in
        Decode.string
            |> Decode.andThen checkHello
```

https://groups.google.com/forum/#!msg/elm-discuss/p3lCDdmeAXM/liXIdzzlCwAJ

## maybe list to empty list

I have this:

`maybe (field "users" (list Share.Model.decodeUser))`
 
in my decoder

@ilias:

you have a couple of options:
- json.decode.pipeline has `optionalField`, but if you're not using pipeline, it might be overkill to pull that in
- you could `map (Maybe.withDefault []) <| maybe (field "users" (list Share.Model.decodeUser))`
- you could `oneOf [field "users" (list Share.Model.decodeUser), succeed []]` to say "either successfully run that decoder, or succeed with an empty list"

## empty string to list decoder

```elm
emptyStringToListDecoder : Decoder (List a)
emptyStringToListDecoder =
    string
        |> andThen
            (\s ->
                case s of
                    "" ->
                        succeed []

                    _ ->
                        fail "Expected an empty string"
            )
```

https://stackoverflow.com/questions/39552307/elm-parse-nested-json

## andThen

```elm
map : (a -> value) -> Decoder a -> Decoder value
```

```elm
andThen : (a -> Decoder b) -> Decoder a -> Decoder b
```

```elm-repl
> String.toInt "a"
Err "could not convert string 'a' to an Int" : Result.Result String Int
> String.toInt "a" == Err "could not convert string 'a' to an Int"
True : Bool
> String.toInt "5"
Ok 5 : Result.Result String Int
> String.toInt "5" == Ok 5
True : Bool
```

```elm
String.toInt "5" == Ok 5
```

```elm
decodeString int "5" == Ok 5
```

```elm
decodeString string """ "someId" """ == Ok "someId"
```

```elm
decodeString (map (\id -> id) string) """ "someId" """ == Ok "someId"
```

```elm
decodeString (map (\id -> "oh " ++ id) string) """ "someId" """ == Ok "oh someId"
```

```elm
decodeString (map (\id -> id) int) """ 5 """ == Ok 5
```

```elm
decodeString (map (\data -> { data = data }) (field "data" int)) """ { "data": 5 } """
```

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (succeed (\data -> { data = data })) )  """ { "data": 1 } """
```

```elm
decodeString ( succeed (\data -> { data = data }) |> andThen (\f -> map f (field "data" int)) )  """ { "data": 1 } """
```

```elm
decodeString (succeed (\data info -> { data = data, info = info }) |> andThen (\f -> map f (field "data" int)) |> andThen (\f -> map f (field "info" string)) )  """ { "data": 1, "info": "Some info" } """
```

```elm
decodeString ( andThen (\f -> map f (field "info" string)) (succeed (\data info -> { data = data, info = info }) |> andThen (\f -> map f (field "data" int))) )  """ { "data": 1, "info": "Some info" } """
```

We need to change order:

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (andThen (\f -> map f (field "info" string)) (succeed (\data info -> { data = data, info = info })) ) ) """ { "data": 1, "info": "Some info" } """ == Ok { data = "Some info", info = 1 }
```

to this:

```elm
decodeString ( andThen (\f -> map f (field "info" string)) (andThen (\f -> map f (field "data" int)) (succeed (\data info -> { data = data, info = info })) ) ) """ { "data": 1, "info": "Some info" } """ == Ok { data = 1, info = "Some info" }
```

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (succeed 5) )  """ { "data": 1 } """
```

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (succeed (\data -> data)) )  """ { "data": 1 } """
```

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (succeed (\data -> { data = data } )) )  """ { "data": 1 } """
```

```elm
decodeString ( andThen (\f -> map f (field "data" int)) (succeed (\data -> 5 )) )  """ { "data": 1 } """
```

```elm
decodeString ( andThen (\f -> map f int) (succeed (\data -> 5 )) )  """ 1 """
```

```elm
decodeString (succeed 4) """ "something" """ == Ok 5
```

```elm
decodeString (map (\raw -> case String.toInt of Ok n -> succeed n)  ) """ "something" """ == Ok 5
```

`decodeString` is like `map`.

```elm-repl
> decodeString (succeed (\info -> info)) """ "something" """
Ok <function> : Result.Result String (a -> a)
```

```elm-repl
> decodeString (map String.toInt string) """ "5" """
Ok (Ok 5) : Result.Result String (Result.Result String Int)
```

Based on https://github.com/elm-community/json-extra/blob/2.0.0/docs/andMap.md

##

```elm
jsonObject2 =
    """
    { "one": 2
    , "two": "something"
    }
"""


deocodeJsonObject2 =
    field "one" int
        |> andThen
            (\one ->
                map (\b -> toString one ++ b) (field "two" string)
            )

main = Html.text <| toString <| Decode.decodeString deocodeJsonObject2 jsonObject2
```