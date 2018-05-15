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
- http://package.elm-lang.org/packages/elm-community/list-split

## List vs Array

> List is great when you make a lot of changes because you are merely updating linked list pointers, whereas Array is great for speedy lookup but has somewhat poorer performance for modifications
> - http://stackoverflow.com/questions/37707577/array-vs-list-in-elm/37707812#37707812

>List is very good at a few things, Array is fine for most things. Even Array makes use of List in it’s internal implementation (take a look at how Array.filter is implementated). For most applications, the Array is a better default. So maybe Array shouldn’t outright replace List, but simply be the data type that is constructed when literal syntax is used (like [1, 2, 3]). It might even be a good idea to rename List to Stack to signal what it really is good at. https://dev.to/skinney/de-throning-the-list-part--44dl https://www.reddit.com/r/elm/comments/8e2s00/dethroning_the_list_part_%CF%80/

## last element

https://www.reddit.com/r/elm/comments/4j2fg6/finding_the_last_list_element

```elm
lastElem : List a -> Maybe a
lastElem list =
    case list of
        [] ->
            Nothing
        [last] ->
            Just last
        head :: rest ->
            lastElem rest
```

or

```elm
lastElem : List a -> Maybe a
lastElem =
    List.foldl (Just >> always) Nothing
```

```elm-repl
> Just
<function> : a -> Maybe.Maybe a
> always
<function> : a -> b -> a
> (>>)
<function> : (a -> b) -> (b -> c) -> a -> c
```

`always` expects two arguments, so when we supply it with one, we get function.