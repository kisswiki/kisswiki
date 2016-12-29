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
