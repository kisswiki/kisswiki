1. `(Model, Cmd Msg) = init`
2. `Html Msg = view Model`
3. `Msg = runtime (Cmd Msg)`
4. `(Model, Cmd Msg) = update (Msg Model)`
5. `goto 2.`


- https://guide.elm-lang.org/architecture/effects/
