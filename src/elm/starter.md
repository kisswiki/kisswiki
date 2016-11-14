```elm
module Main exposing (main)

import Navigation
import Html

main =
    Navigation.program (Navigation.makeParser (\_ -> ()))
        { view = \_ -> Html.text ""
        , update = \_ _ -> ((), Cmd.none)
        , urlUpdate = \_ _ -> ((), Cmd.none)
        , subscriptions = \_ -> Sub.none
        , init = \_ -> ((), Navigation.newUrl "https://google.com")
        }
```

https://github.com/elm-lang/navigation/issues/16
