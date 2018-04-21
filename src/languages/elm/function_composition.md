- http://stackoverflow.com/questions/27441648/what-does-the-operator-mean-in-elm

```elm
f >> g = f(g) = g << f
```

https://csmith111.gitbooks.io/functional-reactive-programming-with-elm/content/section2/FunctionComposition.html

##

https://elmlang.slack.com/archives/random/p1484431928002139

@megapctr:

```elm
matchId : id -> { a | id : id } -> Bool
matchId id =
    .id >> (==) id
```
