```elm
view : Model -> Html Msg
view model =
    Html.form
        [ class "my-form"
        , onWithOptions
            "submit"
            { preventDefault = True, stopPropagation = False }
            (Json.Decode.succeed SubmitPost)
        ]
        [ button []
            [ text "Submit"
            ]
        ]

```

https://stackoverflow.com/questions/36387409/how-to-submit-a-form-in-elm/44141657#44141657