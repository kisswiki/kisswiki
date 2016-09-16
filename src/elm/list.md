```elm
cities =
    [ "Warsaw"
    , "Piaseczno"
    ]
```

display:

```elm
ul []
        map (\l -> li [] [ text l ]) lst
```

- http://stackoverflow.com/questions/24004569/elm-how-do-i-display-a-list-of-strings-in-an-html-list
- http://package.elm-lang.org/packages/elm-lang/core/latest/List
- http://package.elm-lang.org/packages/circuithub/elm-list-extra/latest/List-Extra
- http://stackoverflow.com/questions/23199398/how-do-i-get-a-list-item-by-index-in-elm
- http://stackoverflow.com/questions/33625335/how-to-get-the-first-index-of-a-given-element-in-array-list-in-elm
- http://stackoverflow.com/questions/34252924/position-of-element-in-list
- http://stackoverflow.com/questions/31932683/transpose-in-elm-without-maybe

## List vs Array

> List is great when you make a lot of changes because you are merely updating linked list pointers, whereas Array is great for speedy lookup but has somewhat poorer performance for modifications
> - http://stackoverflow.com/questions/37707577/array-vs-list-in-elm/37707812#37707812
