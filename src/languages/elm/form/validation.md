- https://github.com/rtfeldman/elm-validate
- https://github.com/etaque/elm-form
- https://github.com/ericgj/elm-validation
- https://package.elm-lang.org/packages/Bastes/the-validator/latest/

## show validation error only after leaving the field and no input was entered - dirty/visited

@joelq:

I've used http://package.elm-lang.org/packages/ericgj/elm-validation/1.0.1/Validation before which distinguishes between Initial Valid, and Invalid states


```elm
type Field a
  = NotVisited a
  | Valid a
  | Error String a
```

then you can say:

```elm
type alias Model =
  { firstName : Field String
  , lastName : Field String
  , password : Field String
  }
```


The nice thing about combining errors in the field is that it avoids invalid states

An example of an invalid state would be forgetting to clear errors for a field when it becomes valid:

```elm
    { visitedFields = allTheFields
    , errors = []
    , firstName = "invalid"
    , lastName = "invalid"
    , password = "invalid"
    }
```

a field's error state is coupled to its visited state

hence the union I suggested

- https://elmlang.slackarchive.io/beginners/page-95
- https://stackoverflow.com/questions/47520833/elm-form-show-validation-error-only-after-leaving-the-field-and-input-when-ent
