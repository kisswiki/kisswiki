1. `(Model, Cmd Msg) = init`
2. `Html Msg = view Model`
3. `Msg = runtime (Cmd Msg)`
4. `(Model, Cmd Msg) = update Msg Model`
5. `Sub Msg = subscriptions Model`
6. `go to 2.`

<br>

- https://guide.elm-lang.org/architecture/effects/
- https://github.com/w0rm/creating-a-fun-game-with-elm/blob/master/assets/the-elm-architecture1.jpg
- https://github.com/w0rm/creating-a-fun-game-with-elm/blob/master/assets/the-elm-architecture3.jpg

>Nowadays I think more of branches more in terms of what happens in the outside world. “User clicks add or clicks delete, so that’s (only) 2 branches in my update. In both cases I need to reset the same stuff in my model, so maybe I should extract that bit into a separate function”.
>
>-- https://medium.com/@wintvelt/mental-inefficiency-is-a-great-term-to-describe-the-extra-run-time-cycle-16c60a6b2ccf

<br>

```
addCmds : List (Cmd msg) -> Model -> ( Model, Cmd msg )
addCmds cmds model =
    ( model, Cmd.batch cmds )
    
request : Model -> ContactsFilterState -> ( Model, Cmd Msg )
request model contactsFilterState =
    model
        |> setContactElements []
        |> setContactCount 0
        |> setContactStartIndex 1
        |> setContactFilterState contactsFilterState
        |> addCmds [ getContacts contactsFilterState ]
```

This makes my code really clean and consistent and gets rid of the “bang” operator completely.


Might be helpful:

```elm
toList : a -> List a
toList elem =
    elem :: []
```

## async

>Cmd Msg is an asynchronous request for an update while recursively calling update is synchronous
>
>-- https://www.reddit.com/r/elm/comments/5msw0p/did_you_ever_want_to_turn_your_msg_into_a_cmd_msg/
