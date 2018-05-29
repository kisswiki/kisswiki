## flip

https://ellie-app.com/b4zGHgSfta1/1

## Increment

- https://ellie-app.com/4qmNJJ3kba1/0
- http://elm-lang.org/examples/checkboxes

## json decode
- https://ellie-app.com/3BgHMG99ba1/2
- https://ellie-app.com/f8F3ksBR9a1/6

## Debug

https://ellie-app.com/t7ZB5jTB8a1/0

## no default function parameters

## no varrying number of function parameters

## \ looks similar to λ - lambda

>Functional programming languages implement the lambda calculus. https://en.m.wikipedia.org/wiki/Lambda_calculus

## http

- http://elm-lang.org/examples/http
- https://ellie-app.com/mLdvWd5rKa1/0
- simple request https://ellie-app.com/8TFRD9FVha1/12

```elm
module Main exposing (main)

import Html exposing (Html, text)
import Http
import Json.Decode exposing (..)

main =
    Html.program
        { view = \_ -> text <| "Hello, World!"
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        , init =
            ( ()
            , Http.send identity
                (Http.get "https://jsonplaceholder.typicode.com/posts/1"
                    (map (\v -> Debug.log "v" v) value)
                )
            )
        }
```

## function argument

If a function takes two arguments, why is its type annotation f: a -> b-> c? Wouldn’t something like f: (a, b) -> c make more sense?

functions in Elm always take exactly one argument and return a result (hence the function type annotation syntax).

https://dev.to/matt24ray/partial-application-of-functions-in-elm-ll