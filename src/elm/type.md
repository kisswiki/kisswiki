https://elmlang.slack.com/archives/general/p1484452726014610

@chambost:

1. type Z1 = Z2 Int
2. type Y1 a = Y2 a
3. type X1 a = X2
4. type W1 a = W2 String String

*Long version*:
(Note: elm-repl has been useful in exploring this. It confirms the above four type examples are valid)

Here’s what I think I understand to be true:

1. type Z1 = Z2 Int
(1A) Z1 is a type
(1B) Z2 is a value constructor. Equivalently, it is also a function Z2: Int -> Z1.
(1C) The _only_  way to construct a value of type Z1 is via the Z2 value constructor function.
(1D) An example of using this type in a case statement is as follows

```elm
f q =
    case q of 
        Z2 42 -> "the answer"
        Z2 _ -> "not the answer"
```

2. type Y1 a = Y2 a
(2A) *Y1 a*  is a parametric type.
(2B) All of the following are valid distinct types: *Y1 a*; *Y1 Int*; *Y1 String*; etc.
(2C) Y2 is a value constructor. It is either a function or a class of functions. (Probably the former).
(2D) An example of use in a case statement is these two functions:

```elm
g1 (Y1 q) = 
    case q of 
        42 -> "the answer as an Int"
        _ -> "not the answer"

g2 (Y1 q) =
    case q of 
        "forty-two" -> "the answer as a String"
        _ -> "not the answer"
```

(2E) *BONUS QUESTION*  : Can the two functions above be rewritten as a single function g? Or two pattern-matched definitions of a common function name g?

3. type X1 a = X2
4. type W1 a = W2 String String
(3A) As far as I can tell the above two types X1 and W1 are weird.
(3B) They are parametric types, but the parameter will always be generic (unless you use native trickery
(3C) X2 is a *singleton*  value.
(3D) The only possible case match is:

```elm
h1 q = 
    case q of 
        X2 -> "the only possible option"
```

(4A) W2 can construct multiple distinct values.
(4B) Case matching can be done like so:

```elm
h2 q = 
    case q of 
        W2 "hello" " world" -> "a greeting"
        W2 "forty" "-two" -> "the answer"
        W2 _ _ -> "something else"
```
