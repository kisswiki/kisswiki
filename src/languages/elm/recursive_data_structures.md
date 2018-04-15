- decode json https://github.com/avh4/outlin/blob/7d4bc2adf39761f54a6e25e6e1c503a1453e15e9/Outline/Entry.elm#L323-L335
  - https://groups.google.com/d/msg/elm-discuss/6IiESi_sOUE/tQxNqepV4dAJ
- https://github.com/elm-lang/elm-compiler/blob/master/hints/recursive-alias.md
- http://stackoverflow.com/questions/39500105/elm-recursive-type-definition/39500291
- http://stackoverflow.com/questions/36791460/define-a-nested-or-recursive-list-structure-in-elm
- https://github.com/richardhaven/elm-example-recursive-type
- "To avoid circular dependencies, I find myself putting type declarations in one file" https://groups.google.com/forum/#!msg/elm-discuss/QYw7yR2iVu0/1oSUMTJ2EwAJ
- http://stackoverflow.com/questions/39857251/does-elm-allow-circular-references

##

Representing cyclic graphs in @elmlang

```elm
type alias Graph a =
  Dict Int (Node a)

type alias Node a =
  { edges : List Int
  , info : a
  }
```

- https://twitter.com/czaplic/status/859835338981687296

```haskell
data RoseTree a = RoseTree a [RoseTree a]
```

- https://en.m.wikipedia.org/wiki/Rose_tree
  - https://github.com/GlobalWebIndex/challenge-elm/blob/master/FIRST_STEP.md
