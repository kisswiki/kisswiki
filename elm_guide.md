# Elm Guide

http://guide.elm-lang.org/

## Tagging function

2.1.2. Text Fields

`type Msg = Change String`

> the Change function which was created when we declared the Msg type:
>
> `Change : String -> Msg`
>
> This function is used to tag whatever is currently in the text field.

type is used for defining new union types http://stackoverflow.com/questions/32187565/difference-in-elm-between-type-and-type-alias

http://guide.elm-lang.org/types/union_types.html

```
type User = Anonymous | Named String
activeUsers =
  [ Anonymous, Named "catface420", Named "AzureDiamond", Anonymous ]

userPhoto : User -> String
userPhoto user =
  case user of
    Anonymous ->
      "anon.png"

    Named name ->
      "users/" ++ name ++ ".png"

photos : List String
photos =
  List.map userPhoto activeUsers
```

## Multiline function (let ... in ...)

```
isUpper c =
  let
    s = String.fromChar c
  in
    s == String.toUpper s && s /= String.toLower s
```

- http://www.lambdacat.com/road-to-elm-let-and-in/
