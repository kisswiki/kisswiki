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
