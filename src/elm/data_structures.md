- https://dennisreimann.de/articles/elm-data-structures-list-array-set-dict.html
- https://dennisreimann.de/articles/elm-data-structures-record-tuple.html
- https://medium.com/@blogscot/learning-elm-data-types-6a25420a1b7b

## Specialized

- https://github.com/spisemisu/elm-merkletree

## list

Lists share tails not heads. If you append to a list, you have to copy the entire list, if you prepend (so go from [1 2 3 4] to [0 1 2 3 4]) you're just creating a cell with 0 and a reference to the old list.

https://www.reddit.com/r/programming/comments/6xee86/immutability_the_way_to_remain_unchanged/dmfxjy7/
