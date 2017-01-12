## style guide

- http://package.elm-lang.org/help/design-guidelines
- http://elm-lang.org/docs/style-guide
- https://github.com/NoRedInk/elm-style-guide
- https://gist.github.com/laszlopandy/c3bf56b6f87f71303c9f
- https://github.com/ohanhi/elm-style-guide

## reusable views instead of nested components

There is also one thing about structuring your application. Components vs functions. I suggest going functions way. 

aka "reusable views instead of nested components" https://guide.elm-lang.org/reuse/more.html

@jessta: "It's really functions with a common set of types vs functions with different types for each module so you need to do a lot of conversions." https://elmlang.slack.com/archives/general/p1484225699013668

A very good explanation of why from @rtfeldman https://www.reddit.com/r/elm/comments/5jd2xn/how_to_structure_elm_with_multiple_models/dbkgs2h/

How to tell if someone is using components? They use Html.map for nesting.

Examples of functions way:

- https://github.com/evancz/elm-sortable-table
- https://github.com/evancz/elm-todomvc
- https://github.com/rogeriochaves/structured-elm-todomvc
- input , dropdown, multi select http://package.elm-lang.org/packages/abadi199/elm-input-extra/latest
- Why not components? https://groups.google.com/forum/#!msg/elm-discuss/y1CVQpQpRcc/r6PTWmEGCwAJ

## might be helpful

- Making Impossible States Impossible" by Richard Feldman https://www.youtube.com/watch?v=IcgmSRJHu_8
- viewModel https://medium.com/@ckoster22/upgrade-your-elm-views-with-selectors-1d8c8308b336
- http://blog.jenkster.com/2016/06/how-elm-slays-a-ui-antipattern.html
  - https://github.com/rofrol/elm-taco-browsersync/

## avoiding primitives

https://www.reddit.com/r/elm/comments/5n8omi/lessons_learned_avoiding_primitives_in_elm/dcaptf9/

>The author prefers `Dollar -> Dollar -> Dollar to Int -> Int -> Int`. If I'm reading the code for the first time, this actually introduces an extra layer of complexity: what is Dollar? A Float? An Int? A record type? A union type? I have to go look at its definition and carry that around in my head every time I'm looking at code that uses it. Hopefully someone has not made a duplicate Dollar type in another module, or I'll get really confused.
While I think type signatures are helpful for understanding code requirements, descriptive argument and function names are where meaning should be conveyed.
>
>It probably does make things harder to read - and you have to implement your own arithmetic functions in order to do 'dollar math', to boot. Its a pain, but the win is that you can't pass non-dollar quantities into functions by accident, because to do so creates a compile time error. If you rely only on variable naming, the compiler can't help verify your code, and you're vulnerable to passing quantities into your function that takes dollars, or kilometers into your miles function.
>
>Yeah, points on both sides. I was doing this for a while, but in my case, I just found my thought process to be clearer using primitives. A matter of taste. It's certainly nice to have the option for further compiler-enforced safety.


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

```elm 
CategoriesListHttp (Ok categoriesListContent) ->
    model
        |> updateCategoriesListContent categoriesListContent
        |> addCmdSimple Cmd.none
```

It really helped me with catching many bugs in my code

Because with this pipe technique, it's hard to forget to not pass some updated data etc.
