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
