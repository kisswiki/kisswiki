```bash
# https://guide.elm-lang.org/get_started.html
npm install -g elm
# from vm
elm reactor -a=0.0.0.0
```

## Project structure

> change the entry in "source-directories" to "src" in elm-package.json

- http://blog.jessitron.com/2015/11/getting-off-ground-in-elm-project-setup.html
- http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html

## short

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
