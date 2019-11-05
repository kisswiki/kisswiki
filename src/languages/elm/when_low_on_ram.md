evancz

The `elm` executable is created by Haskell, and therefore it has a Haskell runtime system (RTS).The flags given by 0.19.1 are `-N -qg -A128m` which means it asks for:

- `-N` use all cores
- `-qg` do not do a bad kind of GC
- `A128m` have 128mb for the heap

The space used for the heap is larger than before. I think the default is like 16mb or something? Not sure.You can try running with a smaller heap with a command like this:

`elm make src/Main.elm +RTS -A16mb`

Running `elm +RTS -?` shows all the potential flags you can give. It's actually 1mb by default!

So maybe `+RTS -A1mb` would be the safest bet.
