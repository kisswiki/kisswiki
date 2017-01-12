There is also one thing about structuring your application. Components vs functions. I suggest going functions way. 

aka "reusable views instead of nested component" https://guide.elm-lang.org/reuse/more.html

@jessta: "It's really functions with a common set of types vs functions with different types for each module so you need to do a lot of conversions." https://elmlang.slack.com/archives/general/p1484225699013668

A very good explanation of why from @rtfeldman https://www.reddit.com/r/elm/comments/5jd2xn/how_to_structure_elm_with_multiple_models/dbkgs2h/

How to tell if someone is using components? They use Html.map for nesting.

Examples of functions way:

- https://github.com/evancz/elm-sortable-table
- https://github.com/evancz/elm-todomvc
- https://github.com/rogeriochaves/structured-elm-todomvc
- input , dropdown, multi select http://package.elm-lang.org/packages/abadi199/elm-input-extra/latest
- Why not components? https://groups.google.com/forum/#!msg/elm-discuss/y1CVQpQpRcc/r6PTWmEGCwAJ

This might be helpful:

- Making Impossible States Impossible" by Richard Feldman https://www.youtube.com/watch?v=IcgmSRJHu_8
- viewModel https://medium.com/@ckoster22/upgrade-your-elm-views-with-selectors-1d8c8308b336

## piping

Use his https://medium.com/@billperegoy/i-also-added-another-function-ad59fa2e3ad3#.y4jji4rk8

Though I've slightly modfied it. So I have to functions:

```elm
addCmd : (a -> Cmd msg) -> a -> ( a, Cmd msg )
addCmd fn model =
    ( model, fn model )

addCmdSimple : Cmd msg -> a -> ( a, Cmd msg )
addCmdSimple cmd model =
    ( model, cmd )
```

And then I've small helper functions for update:

```elm
getData : Config.Model -> String -> Cmd Msg
getData config url =
    Http.send CategoriesHttp (Http.get (Config.getApiUrl config url) decodeData)
```

And I'm using it like this:

```elm
CategoriesHttp (Ok categories) ->
    model
        |> updateCurrentCategory
            (case findCategoryByRoute categories model.currentCategory.route of
                Just category ->
                    category

                Nothing ->
                    firstOrEmptyCategory categories
            )
        |> updateCategories categories
        |> addCmd getCategoriesListData
```

 
And for functions that doesn't take arguments I use addCmdSimple:

```        
CategoriesListHttp (Ok categoriesListContent) ->
    model
        |> updateCategoriesListContent categoriesListContent
        |> addCmdSimple Cmd.none
```

It really helped me with catching many bugs in my code

Because with this pipe technique, it's hard to forget to not pass some updated data etc.
