- http://stackoverflow.com/questions/40095094/elm-clear-form-on-submit
- http://stackoverflow.com/documentation/elm/8087/backend-integration
- https://api.stackexchange.com/docs
- https://auth0.com/blog/creating-your-first-elm-app-part-2/
- http://stackoverflow.com/questions/38238062/how-to-consume-http-post-in-elm-with-header-and-body
- POST Http.request in Elm 0.18 https://groups.google.com/forum/#!topic/elm-discuss/Kxq8q5n-E68
- https://discourse.elm-lang.org/t/a-form-api-idea-proposal/1121
- https://discourse.elm-lang.org/t/strategies-for-representing-persisted-and-un-persisted-remote-data/1115/8
  - http://package.elm-lang.org/packages/stoeffel/elm-verify/latest/
- https://mordrax.gitbooks.io/elm-at-phd/content/chapters/forms.html
  - https://www.reddit.com/r/elm/comments/8anvrz/elm_at_pacific_health_dynamics/
- https://dev.to/joanllenas/controlled-number-input-with-floats-in-elm-4jin

## validation

- http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm
- https://github.com/rtfeldman/elm-validate
- https://github.com/etaque/elm-form
- https://github.com/ericgj/elm-validation
  - http://package.elm-lang.org/packages/ericgj/elm-validation/latest/Validation
  - https://www.reddit.com/r/elm/comments/5sms0u/elmvalidation_feedback_wanted/
- https://becoming-functional.com/a-form-validation-library-for-elm-82ef8c7c39d9

## prevent submit redirect

```elm

Looks like `action "javascript:void(0);"` is not needed. https://ellie-app.com/9zTH65GHXa1/0 and `onSubmit` already has `preventDefault` set to `True` https://github.com/elm/html/blob/2.0.0/src/Html/Events.elm#L130

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
