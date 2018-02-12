- http://elm-lang.org/examples/time
- simple example I've created https://ellie-app.com/39kwkcNPF49a1/0
- http://stackoverflow.com/questions/40599512/how-to-achieve-behavior-of-settimeout-in-elm
-  happen only "once, after x seconds" http://stackoverflow.com/questions/40599512/how-to-achieve-behavior-of-settimeout-in-elm/40610172#40610172

## Current time

```elm
type Msg
    = GetTime
    | NewTime Time
-- in update
Task.perform NewTime Time.now
```

- https://github.com/rofrol/elm-date-playground
- http://package.elm-lang.org/packages/elm-lang/core/latest/Task#perform
- https://becoming-functional.com/tasks-in-elm-0-18-2b64a35fd82e
- http://stackoverflow.com/questions/38021777/how-do-i-get-the-current-time-in-elm-0-17-0-18/41383057#41383057

## Distance

`elm package install alpacaaa/elm-date-distance`

```elm
import Date.Distance
import Date.Distance.I18n.En
--...
viewComment : Time -> Comment -> Html msg
viewComment currentTime comment =
    let
        inWords =
            { locale = Date.Distance.I18n.En.locale { addSuffix = True }
            , includeSeconds = False
            }
                |> Date.Distance.inWordsWithConfig
    in
        div []
            [ blockquote [ class "comment-quote" ] [ text comment.content ]
            , div [ class "comment-meta" ]
                [ img [ class "user_icon", src comment.magicUrl ] []
                , span [] [ text comment.userName ]
                , span [ class "comment-date" ] [ text <| inWords (Date.fromTime currentTime) comment.createDate ]
                ]
            ]
```