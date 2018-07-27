- http://package.elm-lang.org/packages/elm-community/graph/latest
- http://package.elm-lang.org/packages/zwilias/elm-tree/latest

## Cyclic


```elm
type alias Graph a =
  Dict Int (Node a)

type alias Node a =
  { edges : List Int
  , info : a
  }
```

https://twitter.com/czaplic/status/859835338981687296

## Rose tree

>a multi-way tree or rose tree is a tree data structure with a variable and unbounded number of branches per node https://en.m.wikipedia.org/wiki/Rose_tree

- http://package.elm-lang.org/packages/zwilias/elm-rosetree/latest
- http://package.elm-lang.org/packages/turboMaCk/lazy-tree-with-zipper/latest
- https://github.com/tomjkidd/elm-multiway-tree-zipper/
- http://package.elm-lang.org/packages/bardt/elm-rosetree/latest/RoseTree
