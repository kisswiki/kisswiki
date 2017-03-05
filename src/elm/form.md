- validation
  - http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm
  - https://github.com/rtfeldman/elm-validate
- https://github.com/etaque/elm-simple-form
- http://package.elm-lang.org/packages/ericgj/elm-validation/latest
  - https://www.reddit.com/r/elm/comments/5sms0u/elmvalidation_feedback_wanted/
- http://stackoverflow.com/questions/40095094/elm-clear-form-on-submit

## prevent submit redirect

```elm

type alias Model =
  { newComment: String
  }

type Msg
    = AddComment
    | UpdateComment String

view = form
    [ onSubmit submitMsg, action "javascript:void(0);" ]
    [ textarea [ style [ value newComment, onInput <| toNewCommentMsg ] []
    , button [ type_ "submit" ] [ text "Add Comment" ]
    ]
```

- https://groups.google.com/d/msg/elm-discuss/W3X_m1mE70w/_HhJvKFnBQAJ
- https://github.com/Gizra/elm-hedley/blob/de31e8fe5c9b4b2f670519b298ff6ba92bc67eee/src/elm/Pages/Login/View.elm#L48
