Previously on https://gist.github.com/rofrol/14041bc816eddccdb53e5c677537466a

## Introduction

This guide assumes that you have some basic understanding of Elm. Updated to Elm-0.19.

I will try to teach you Elm [json](https://package.elm-lang.org/packages/elm/json/latest/) decoding in layman terms leveraging the knowledge of basic programming. No category theory, sorry.

## Basics

Json decoding in Elm is like a pipe or stream. In the examples I will try to use flow from right to left:

```
Result <-- decode <-- String
```

Generally decoding starts with [`String`](https://package.elm-lang.org/packages/elm/core/latest/String) and ends with [`Result`](https://package.elm-lang.org/packages/elm/core/latest/Result).

<details>
 <summary>More about Result</summary>

Ok result:

```elm
result =
    Ok "Some value"


main =
    case result of
        Ok value ->
            text value

        Err err ->
            text err
-- Some value
```

[Run](https://ellie-app.com/3d2GRfkgMRJa1)

Error result:

```elm
result =
    Err "Some error"


main =
    case result of
        Ok value ->
            text value

        Err err ->
            text err
-- Some error
```

[Run](https://ellie-app.com/3d2FhsKHsVQa1)

</details>

<details>
 <summary>repl will also output type annotations</summary>

You can run examples in `elm repl`:

```bash
$ elm repl
> import Json.Decode exposing (decodeString, string)
> decodeString string """ "something" """
Ok "something" : Result.Result String String
> decodeString string """ 3 """
Err "Expecting a String but instead got: 3" : Result.Result String String
```

</details>

## String

`String` in, `Result` out:

```elm
decodeString string """ "something" """
-- Ok "something" <-- you will see this if you open Run link
```

[Run](https://ellie-app.com/3cvG8htJKgQa1)

<details>
 <summary>Full example</summary>

First install `elm/json` package:

```bash
$ elm package install -y elm/json
```

Then put it in `Main.elm`:

```elm
module Main exposing (main)

import Html exposing (text)
import Json.Decode exposing (decodeString, string)


main =
    text <| Debug.toString <| decodeString string """ "something" """
```

</details>

## Error when trying to get String from number

```elm
decodeString string """ 3 """
-- Err (Failure "Expecting a STRING" <internals>)
```

[Run](https://ellie-app.com/3cZgxXpPCB3a1)

## Number

```elm
decodeString int """ 3 """
-- Ok 3
```

[Run](https://ellie-app.com/3cvGVMfKvGCa1)

## List of numbers

Here we create new decoder by combining [`list`](https://package.elm-lang.org/packages/elm/json/latest/Json-Decode#list) decoder with [`int`](https://package.elm-lang.org/packages/elm/json/latest/Json-Decode#int) decoder:

```elm
decodeString (list int) """ [1, 3, -1, 5] """
-- Ok [1,3,-1,5]
```

[Run](https://ellie-app.com/3cvHmFfvvRJa1)

## Map

What if you get a number, but want to get `Result` with increased number or `Err` if something goes wrong? Or:

- put number in a list
- decode JSON object into Elm record
- some other logic

Then use [`map`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#map) which combines function with decoder giving us new decoder:

```elm
map someFunction someDecoder
```

And with `decodeString` it looks like this:

```elm
decodeString (map someFunction someDecoder) someString
```

<details>
 <summary>More about map</summary>

As you already know, this json decode pipe starts with `String` and ends with `Result`.

But everything between needs to be wrapped in `Decoder`. It looks something like this:

```elm
deocodeString (Decoder a) String
```

So `decodeString` takes `String` and runs decoder on it and wraps it in `Decoder`.

With `map` we unwrap value from `Decoder`, run function on value, wrap returned value with `Decoder`:

```
Result <-- wrap <-- function <-- unwrap <-- decoder <-- String
```

</details>

## Use map but just return the same value

```elm
decodeString (map (\a -> a) int) """ 3 """
-- Ok 3
```

[Run](https://ellie-app.com/3cvJyBRdcT9a1)

## Increase number

```elm
decodeString (map (\a -> a + 3) int) """ 3 """
-- Ok 6
```

[Run](https://ellie-app.com/3cvJXT3vhr5a1)

## Put number in a list

Example showing that `map` operates between types and not just values.

```elm
decodeString (map (\a -> [ a ]) int) """ 3 """
-- Ok [3]
```

[Run](https://ellie-app.com/3d3rm6msD6Ja1)

## Return positive number or zero

```elm
decodeString
    (map
        (\a ->
            if a > 0 then
                a

            else
                0
        )
        int
    )
    """ 4 """
-- Ok 4
```

[Run](https://ellie-app.com/3d3FDdwm6PSa1)

<details>
 <summary>Example with -1</summary>

```elm
decodeString
    (map
        (\a ->
            if a > 0 then
                a

            else
                0
        )
        int
    )
    """ -1 """
-- Ok -1
```

[Run](https://ellie-app.com/3d3FNpDW8tPa1)

</details>

## Get number from object with one field

Here we combine `field` decoder with `int` decoder:

```elm
decodeString (field "one" int) """ { "one": 1 } """
-- Ok 1
```

[Run](https://ellie-app.com/3cvDHVFccWba1)

## Get first number from object with two fields

```elm
decodeString (field "one" int) """ { "one": 1, "two": 2 } """
-- Ok 1
```

[Run](https://ellie-app.com/3cvJ3JBrmtya1)

## Unhandled fields

As you can see above, no errors when we use `field` even though there might by some unhandled fields.

There is a possibility to get warning or error in such situation, but I will talk about it later.
