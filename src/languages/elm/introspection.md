## import your module into repl

https://elmlang.slack.com/archives/general/p1484315236014061

aion:

i always use a special module: MyRepl.elm which is constantly imported in the REPL and i write stuff in the editor - and just inspect in REPL like:

```elm
someFunction arg1 arg2 = 
         "doNothing"
whatIsThis = someFunction "first argument"
```

Then in the Repl you do:

```elm
import MyRepl exposing (..)
and just:
whatIdThis
> <function> whatIsThis: a -> String -- or something like that
```

## ast

https://elmlang.slack.com/archives/general/p1484315916014089

@aion:

it you'd be nice if based on that AST you can see like x-Ray vision every type of every variable - i mean what is inferred by the compiler - because in reality everything everywhere in the code has a type - you just don't see it..
