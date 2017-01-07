- Exporting Union Types in Elm Syntax https://github.com/elm-lang/elm-lang.org/issues/523

If we have a submodule with:

`type Animal = Cat | Dog`

we can export Cat and Dog with:
`module Submodule exposing (Animal(..))`

and import with
`import Submodule exposing (Animal(..))`
