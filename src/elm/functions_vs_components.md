There is also one thing about structuring your application. Components vs functions. I suggest going functions way.

aka "reusable views instead of nested component" https://guide.elm-lang.org/reuse/more.html

This is very good explanation of why from @rtfeldman https://www.reddit.com/r/elm/comments/5jd2xn/how_to_structure_elm_with_multiple_models/dbkgs2h/

How to tell if someone is using components? They use Html.map for nesting.

Examples of functions way:

- https://github.com/evancz/elm-sortable-table
- https://github.com/evancz/elm-todomvc
- https://github.com/rogeriochaves/structured-elm-todomvc
- input and dropdown http://package.elm-lang.org/packages/abadi199/elm-input-extra/latest
- Why not components? https://groups.google.com/forum/#!msg/elm-discuss/y1CVQpQpRcc/r6PTWmEGCwAJ
