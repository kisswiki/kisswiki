```elm
onClickNoDefault : msg -> Attribute msg
onClickNoDefault message =
    let
        config =
            { stopPropagation = True
            , preventDefault = True
            }
    in
        onWithOptions "click" config (Json.Decode.succeed message)
```

- https://becoming-functional.com/elm-html-events-preventing-page-scroll-8a4b3b03615a

or shorter

```elm
onClickPrevent : msg -> Attribute msg
onClickPrevent message =
    onWithOptions "click" (Options True True) (JD.succeed message)
```
