```elm
(Model, Cmd Msg) = init

Html Msg = view Model
Msg = runtime Cmd Msg
(Model, Cmd Msg) = update Msg Model

Html Msg = view Model
Msg = runtime Cmd Msg
(Model, Cmd Msg) = update Msg Model

Html Msg = view Model
Msg = runtime Cmd Msg
(Model, Cmd Msg) = update Msg Model

```

- https://guide.elm-lang.org/architecture/effects/
