gampleman [3:16 PM]
`::` should be a lot faster
`n ++ m` is O(n)
`a :: n` is O(1)

Kalabibishkis [3:33 PM]
`::` - reduces
game was loading 3s, after small tweeks now loads under 1s

Malax [3:34 PM]
To elaborate a bit, `::` is adding to the front of the list, which only requires creating a new value for the head. `++` needs to update _all_ values that make up the list. That’s why it has the performance characteristics @gampleman pointed out. (edited) 

Kalabibishkis [3:35 PM]
just found one function, that uses `++` - replaced it with `::`, and some other small tweeks (List.repeat, replaced with cache..)
now need to check is there way to improve https://github.com/justgook/platformer/blob/revision3/lib/elm-image-encode/src/Image/BMP.elm#L136-L155
btw - interesting - `elemnt::list` + `List.reverse` vs `list++[element]` (edited) 

gampleman [3:51 PM]
Actually that’s a common trick in making functions tail recursive is to use `el :: list` in the recursive case and do a `List.reverse` in the base case. That leaves you with a O(n) total complexity vs O(n n/2) when doing  `list++[element]`.

ilias [6:16 PM]
It also has memory implications - `a :: b` uses structural sharing, while `a ++ [ y ]` needs to construct a whole new list. So also in terms of memory usage, cons + reverse sames some time compared to "append to the end". And as it happens, `List.reverse` is quite fast!

That said, it can be made faster by loop unrolling, at the cost of a larger compiled result
