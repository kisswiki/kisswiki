```elm
import Html as H

main = "Hello " ++ (String.toInt "5" |> Result.toMaybe |> Maybe.withDefault 0 |> toString) |> H.text
```

https://www.reddit.com/r/elm/comments/3c012n/noob_question_about_toint/cssc6kq/

>I'd make is to use a Result instead of Maybe. I'd like to know which field failed to decode in an error message.
>
>-- https://groups.google.com/forum/#!msg/elm-discuss/XW-SRfbzQ94/aKufhX0LBgAJ
