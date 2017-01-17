## More args in the signature than in method

https://www.elm-tutorial.org/en/tips-tricks/point-free-style.html

## More args in the method than in it's signature

https://elmlang.slack.com/archives/general/p1484313034014000

@chalmagean:

why are there more args in the method than in it's signature?

```elm
field : String -> Validation e a -> Validation e a
field key validation field =
```

@folkertdev:

if `Validation` is a type alias for a function

```elm
type alias Validation customError output =
    Field -> Result (Error customError) output
```

so actually the type is `field : String -> Validation customError output -> Field -> Result (Error customError) output`
 
which indeed has three arguments

it would be more clear if `Validation` were a type instead of a type alias

which is recommended for libraries

@chalmagean:

then ther's this, which has an argument in the declaration but not in the signature
```string : Validation e String
string v =```


## Function with no arguments and returning nothing

define and call

```elm
a = \() -> ()
a ()
```

`()` means empty tuple

## String -> a

>The function String -> a is called eval, and it's not coming to Elm because it would break all kinds of type guarantees. You can implement functions from String to a specific concrete type, although that type will have to have some notion of failure or emptiness if it's not wrapped in a Maybe or a Result.
>
>-- https://groups.google.com/forum/#!msg/elm-discuss/pGKdod7KaEc/KSQPC_5RAwAJ
