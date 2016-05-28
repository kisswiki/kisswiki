# Elm Guide

- http://guide.elm-lang.org/
- http://elm-lang.org/docs/syntax
- http://package.elm-lang.org/packages/elm-lang/core/latest/Basics
- https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Elm.html
- http://package.elm-lang.org/packages/elm-lang/core/latest/String
- http://package.elm-lang.org/packages/elm-lang/core/latest/Char
- elm make, elm reactor

## elm repl

- http://stackoverflow.com/questions/34375446/type-annotations-in-elm-repl

Multiline:

1. type `over9000 powerLevel = \`
2. press Enter, Space, Space
3. type `if powerLevel > 9000 then "It's over 9000!!!" else "meh"`
4. press Enter

https://github.com/elm-lang/elm-repl/issues/67#issuecomment-125012923

## True and False

```
not True == False
not False == True
```

- http://package.elm-lang.org/packages/elm-lang/core/latest/Basics

> Elm does not have the notion of “truthiness”.
> The condition must evaluate to True or False, and nothing else.
> - https://github.com/izdi/elm-cheat-sheet#if

## Installing Html

`elm package install elm-lang/html`

- https://elm-community.github.io/elm-faq/#why-does-elm-repl-or-elm-make-report-cannot-find-module-html
- http://stackoverflow.com/questions/34201205/elm-cannot-find-module
- http://stackoverflow.com/questions/37454562/elm-get-started-documentation-cannot-find-module
- package.elm-lang.org/packages/elm-lang/html/latest/

## Destructuring (or pattern matching)

https://gist.github.com/yang-wei/4f563fbf81ff843e8b1e

## Tagging function and Union Types

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

| javascript | elm  | notice     |
| ---        | ---  | ---        |
| !==        | /=   |            |
| !          | not  |            |
| &&         | &&   |            |
| \|\|       | \|\| |            |
| +          | ++   | on strings |

- https://github.com/izdi/elm-cheat-sheet#operators
- https://elm-community.github.io/elm-faq/operators.html
- https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Elm.html

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

> values which aren't dependant on another value in the same scope get processed bottom-up. When a value relies on another value within the same scope, it is handled separately and put at the bottom.
> - http://stackoverflow.com/questions/33476943/why-debug-log-prints-out-in-reversed-order-in-elm

> Since Elm is functional, we don't deal with statements or the notion of "doing" stuff most of the time, but instead we deal with constructing values.
> "Let these values be so and so in the following expression"
> - https://www.reddit.com/r/elm/comments/3jpnhb/what_is_let_in/

- http://stackoverflow.com/questions/37101583/elm-executing-multiple-lines-in-a-function

## Debug

```
import Debug
_ = Debug.log "my message" someValue

update : Msg -> Model -> Model
update action model =
  case action of
    Send ->
      Debug.log "model" model
```

- https://elm-community.github.io/elm-faq/#how-can-i-write-debugging-information-to-the-console
- http://package.elm-lang.org/packages/elm-lang/core/latest/Debug
- http://jaketrent.com/post/debug-locally-elm/
- http://stackoverflow.com/questions/33476943/why-debug-log-prints-out-in-reversed-order-in-elm

## Loop

No loop, use List.map etc.

- https://groups.google.com/forum/#!topic/elm-discuss/E2mgQnQWD3c
