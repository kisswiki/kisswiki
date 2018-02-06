We use identity because we already have list with maybe values:

>We take our array, apply toList to it, then apply filterMap with it. Filter map takes a function which produces a maybe, and applies it to every element in the list, discarding the Nothing cases. We just apply the identity functions, which discards the Nothing values that are already there.
>
>-- http://stackoverflow.com/questions/33093359/how-to-filter-out-nothing-values-from-elm-array
