- http://stackoverflow.com/questions/40095094/elm-clear-form-on-submit
- http://stackoverflow.com/documentation/elm/8087/backend-integration
- https://api.stackexchange.com/docs
- https://auth0.com/blog/creating-your-first-elm-app-part-2/
- http://stackoverflow.com/questions/38238062/how-to-consume-http-post-in-elm-with-header-and-body
- POST Http.request in Elm 0.18 https://groups.google.com/forum/#!topic/elm-discuss/Kxq8q5n-E68

## validation

- http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm
- https://github.com/rtfeldman/elm-validate
- https://github.com/etaque/elm-form
- http://package.elm-lang.org/packages/ericgj/elm-validation/latest
  - https://www.reddit.com/r/elm/comments/5sms0u/elmvalidation_feedback_wanted/

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

- http://stackoverflow.com/questions/36387409/how-to-submit-a-form-in-elm/42612811#42612811
- https://groups.google.com/d/msg/elm-discuss/W3X_m1mE70w/_HhJvKFnBQAJ
- https://github.com/Gizra/elm-hedley/blob/de31e8fe5c9b4b2f670519b298ff6ba92bc67eee/src/elm/Pages/Login/View.elm#L48
- http://musigma.org/elm/2016/11/28/elm.html
- https://bkbooth.me/building-a-basic-ui-clone-of-instagram-using-elm-part-3/
