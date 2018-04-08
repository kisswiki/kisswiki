https://elmlang.slackarchive.io/beginners/page-99

@eveline:

hi everyone! I wrote a recursive decoder, but I keep getting the `decoder.callback is not a function` error. Here is my code: https://ellie-app.com/3cyRSDDVb2Sa1/1. I read the solution Evan wrote on this problem, but I still can't get it to work... I also asked this question on reddit, and someone suggested this answer https://ellie-app.com/3cGKP4Djcdqa1/0, which seems to work - but when I put it in my project I still get the `decoder.callback is not a function error`...

the recursive is a known issue (https://github.com/elm-lang/elm-compiler/issues/1591), and the fix for this problem should be https://github.com/elm-lang/elm-compiler/blob/master/hints/recursive-alias.md but I implemented this, and I still get the error... So I'm not sure what I'm doing wrong

@ilias:

So, it's a tricky issue; but it's solvable

I see at least one place you need to add a `lazy` - `decodeAction2` refers to `decodeBlocklyActions` (in the compiled result) before it's defined

actually, doesn't even need `lazy` - spelling out the lambda is enough

https://ellie-app.com/3cXyfz52zQVa1/0
 

background information: Elm compiles this to js variables, not functions, which means the order of definition and the order in which things are referenced is very important. What `lazy` does is just wrap something in a `function () {}` so that it can reference something that's only declared later on. The order in which declaration are written to the compiled result, is computed using a heuristic based on strongly connected components. This works, usually, but since decoders involve very few functions and mostly just values, it tends to go wrong there much more often.

in this case; the problem was here:

```var decodeAction2 = A2(
    Json_Decode$andThen,
    decodeBlocklyActions,
    A2(Json_Decode$field, 'action', Json_Decode$string));
var _decodeBlocklyActions = function (action) { ...}```

note that it's hard/impossible to predict the order in which output will happen; so the best option, for now, it so keep your fingers crossed that you don't run in to it

or to add `lazy` at all possible points of recursion, yes (as in, `decodeAction2` is eventually called - though lazy - in `decodeBlocklyActions`, so add `lazy` there, too)

@eveline:

where do I have to add lazy? for all the options in the `decodeBlocklyActions`?

@ilias:

nah, I think this should handle it:

```decodeAction2 : () -> Decoder BlocklyAction
decodeAction2 _ =
    field "action" Decode.string
        |> Decode.andThen (\a -> decodeBlocklyActions a)```

if you still get that exact error; I'd focus on places you use `andThen`

 ```decodeAction : Decoder (List BlocklyAction)
decodeAction =
    field "action" Decode.string
        |> Decode.andThen (\a -> decodeBlocklyActions a)
        |> Decode.list
```

that one, for example

(note that I added a `\a -> ` lambda so it becomes a `function(a){..}` in the compiled result

- the reason I'm saying "focus on `andThen`" being that that's the only place `decoder.callback` is used; so if the error mentions that, that's where it's going wrong :slightly_smiling_face:

@eveline:

https://ellie-app.com/3cY6tQ9dcQKa1/0

in the ellie it works fine

##

- code gen problems https://github.com/elm-lang/elm-compiler/issues/1377
- https://github.com/elm-lang/elm-compiler/labels/meta
