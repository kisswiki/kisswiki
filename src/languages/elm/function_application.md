https://elmlang.slack.com/archives/general/p1484353888014304

@montanonic:

`<|` does nothing more than allow you to omit parenthesis in more complex function calls.

`(<|) function value = function value`

its definition is literally just function application


the "magic" is that its an infix operator, so you can write `function <| value`

and if `value` is something more involved like `(Css.px 100)`
