- http://stackoverflow.com/questions/38288963/how-i-can-pass-to-a-function-the-union-type-without-including-the-tag

## Exporting and importing Union Types in Elm Syntax

If we have a submodule with:

`type Animal = Cat | Dog`

we can export Cat and Dog with:

`module Submodule exposing (Animal(..))`

and import with

`import Submodule exposing (Animal(..))`

or

`
import Submodule
-- ...
Submodule.Animal
`

- https://github.com/elm/elm-lang.org/issues/523
- https://stackoverflow.com/questions/49504258/import-union-type-with-a-qualified-name
