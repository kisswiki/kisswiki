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

## Operators

| javascript | elm  |
| ---        | ---  |
| !==        | /=   |
| !          | not  |
| &&         | &&   |
| \|\|       | \|\| |

- https://github.com/izdi/elm-cheat-sheet#operators
- https://elm-community.github.io/elm-faq/operators.html

## Char.isLower and Char.isUpper only recognize ASCII letters

https://github.com/elm-lang/core/pull/385

## Multiline function (let ... in ...)

```
isUpper c =
  let
    s = String.fromChar c
  in
    s == String.toUpper s && s /= String.toLower s
```

> In an imperative language you can get away with sprinkling your variables all over the place. Nothing is enforcing their placement in a particular place in the code.
> In many functional languages the variables you need for a specific function are defined in a let, and then they are in scope only for the code between the let and the end of the function.
> Also the in part must evaluate to one expression, you can't just write line after line in it.
> - http://www.lambdacat.com/road-to-elm-let-and-in/

> The most common form of a local definition is a function argument. Exactly like JavaScript, any argument is visible from anywhere inside the function.
> The other form of local definitions are created using a let... in... statement
> - https://github.com/elm-guides/elm-for-js/blob/master/Scope.md
