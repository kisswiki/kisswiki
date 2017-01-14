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

## update field

https://www.reddit.com/r/elm/comments/5nogll/pattern_when_using_many_text_inputs/

You can't iterate over records like that.

You could put all your fields in a Dict, and update by key.

Something like this:

```elm
update : Msg -> Model -> Model
update msg model =
    case msg of
        FieldInput name value ->
            { model
                | fields = 
                  Dict.update 
                    name 
                    (Maybe.map <| fieldUpdate value) 
                    model.fields
            }

fieldUpdate : String -> Field -> Field
fieldUpdate newValue field =
    { field
        | value = newValue
        , validated = True
    }
```

>Elm does not allow you to enumerate over the items in a record. For type-safety no doubt.
>
>-- http://stackoverflow.com/questions/40517852/elm-how-to-pretty-print-the-model-in-the-browser
