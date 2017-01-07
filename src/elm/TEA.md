1. `(Model, Cmd Msg) = init`
2. `Html Msg = view Model`
3. `Msg = runtime (Cmd Msg)`
4. `(Model, Cmd Msg) = update (Msg Model)`
5. `goto 2.`

<br>

- https://guide.elm-lang.org/architecture/effects/
- https://github.com/w0rm/creating-a-fun-game-with-elm/blob/master/assets/the-elm-architecture3.jpg
