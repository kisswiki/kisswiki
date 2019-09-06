## destructure field

https://elmlang.slack.com/archives/general/p1484421168014491

@tolgapaksoy:

```elm
yourFn ({field} as aRecWithUnionTypeField) =
    case field of
```

##you can't match on dynamic data

use if expressions https://elmlang.slack.com/archives/general/p1483989240012353

https://elmlang.slack.com/archives/general/p1484504146014761

@vitali.f:

https://runelm.io/c/psz

```elm
module Main exposing (..)

import Html exposing (Html, text)


type User
    = Anonymous
    | Regular


main : Html msg
main =
    text <| toString [ x, y ]


isUser : User -> User -> Int -> Int -> Int
isUser user expected yes no =
    case user of
        expected ->
            yes


x =
    isUser Anonymous Regular 100 200


y =
    isUser Anonymous Anonymous 100 200
```


@wintvelt:

You cannot use variables in case statements like that.
In the function

```elm
isUser user expected yes no =
  case user of
    expected ->
```

the `expected` in the branch will be reassigned as a new variable for pattern matching. So ALL users will match this branch.
So your single branch covers all cases possible.
Elm will not take the `expected` you pass in as a variable to do pattern matching.
You can however do `==` comparison on strong types, so replacing the `case` with `if user == expected` would work.


## String -> a

https://github.com/elm/core/issues/805#issuecomment-272766977

```elm
locationUpdate : Navigation.Location -> App.Msg
locationUpdate location =
  case (String.dropLeft 2 location.hash) of

    "ViewDocList" -> ViewState ViewDocList

    "ViewDocument" -> ViewState ViewDocument

    _ -> App.NoOp

    -- Would rather code this as:
    -- case Text.fromString msg of
    --   Just value -> ViewState value
    --   Nothing    -> App.NoOp
```


>The function String -> a is called eval, and it's not coming to Elm because it would break all kinds of type guarantees. You can implement functions from String to a specific concrete type, although that type will have to have some notion of failure or emptiness if it's not wrapped in a Maybe or a Result.
>
>-- https://groups.google.com/forum/#!msg/elm-discuss/pGKdod7KaEc/KSQPC_5RAwAJ
