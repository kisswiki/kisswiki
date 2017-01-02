## extensible records

```elm
type alias Point =
  { x : Float
  , y : Float
  }

type alias Positioned a =
  { a | x : Float, y : Float }
```

>This syntax is defining types that have at least certain fields, but may have others as well. So Positioned a is a record with at least an x and y field.
>
>This syntax is defining types that have at least certain fields, but may have others as well. So Positioned a is a record with at least an x and y field.
>
>This means you can define records that have any subsection of these fields.
>
>-- http://elm-lang.org/docs/records

## function to access

```elm
origin : Point
origin = { x = 0, y = 0 }

doubledX : Point -> Float
doubledX = ((*) 2) << .x
```

- https://lexi-lambda.github.io/blog/2015/11/06/functionally-updating-record-types-in-elm/
