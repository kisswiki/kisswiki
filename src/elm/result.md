```elm
import Html as H

main = "Hello " ++ (String.toInt "5" |> Result.toMaybe |> Maybe.withDefault 0 |> toString) |> H.text
```

https://www.reddit.com/r/elm/comments/3c012n/noob_question_about_toint/cssc6kq/
