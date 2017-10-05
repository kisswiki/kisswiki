```elm
Url.map SettingsRoute (Url.s "settings" <?> Url.stringParam "sortBy" <?> Url.intParam "pageNumber")
```

```elm-repl
> type alias SearchParams = { search : Maybe String, sortBy : Maybe String }
> parsePath (map SearchParams (s "blog" <?> stringParam "search" <?> stringParam "sortBy")) (Location "" "" "" "" "" "" "/blog" "?search=cats&sortBy=name" "" "" "")
Just { search = Just "cats", sortBy = Just "name" }
    : Maybe.Maybe Repl.SearchParams
```

- https://stackoverflow.com/questions/43111085/evancz-url-parser-and-multiple-query-parameters
- https://github.com/evancz/url-parser/issues/33
