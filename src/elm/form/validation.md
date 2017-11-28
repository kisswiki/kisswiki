@joelq:

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

https://elmlang.slackarchive.io/beginners/page-95